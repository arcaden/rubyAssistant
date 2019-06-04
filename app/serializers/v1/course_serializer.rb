# frozen_string_literal: true

class V1::CourseSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :professor,
             :time,
             :dates
end
