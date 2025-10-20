class CreateCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.integer :duration_hours
      t.string :difficulty
      t.references :instructor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
