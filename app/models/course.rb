# frozen_string_literal: true

class Course < ActiveRecord::Base
  validates :code, uniqueness: true
end
