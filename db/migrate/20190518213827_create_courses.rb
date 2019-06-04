# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :professor
      t.string :code
      t.string :dates
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
