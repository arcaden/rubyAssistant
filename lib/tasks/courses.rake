# frozen_string_literal: true

require_relative '../../app/models/course'

namespace :courses do
  desc 'Pulls list of courses from Waterloo API'
  task refresh: :environment do
    course_list = %w[112 114 192 162 182]
    course_list.each do |code|
      puts code
    end
  end
end
