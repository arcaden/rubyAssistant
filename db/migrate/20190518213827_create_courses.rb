class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :professor
      t.string :code
      t.string :dates
      t.string :time

      t.timestamps
    end
  end
end
