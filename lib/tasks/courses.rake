# frozen_string_literal: true

require_relative '../../app/models/course'
require 'json'
require 'httparty'

namespace :courses do
  desc 'Pulls list of courses from Waterloo API'
  task refresh: :environment do
    course_list = %w[112 114 192 162 182]
    course_list.each do |code|
      url = "https://api.uwaterloo.ca/v2/courses/SYDE/#{code}/schedule.json"
      res = HTTParty.send(
        :get,
        url,
        query: {
          'key' => 'a5ff0a2ff73a21b39e22b50ef4ec8fb9'
        }
      )
      if res['meta']['status'] == 200
        parsed_response = JSON.parse(res.body)
        course_data = parsed_response['data']
        lecture = course_data[0]
        new_course = Course.find_or_create_by(
          title: lecture['title'],
          professor: lecture['classes'][0]['instructors'][0],
          code: lecture['catalog_number'],
          dates: lecture['classes'][0]['date']['weekdays'],
          start_time: lecture['classes'][0]['date']['start_time'],
          end_time: lecture['classes'][0]['date']['end_time']
        )
        puts "Course with code: #{code}, stored"
      else
        puts res['meta']['status']
        puts "Bad Request with course code: #{code}, course not updated/created"
      end
    end
  end
end
