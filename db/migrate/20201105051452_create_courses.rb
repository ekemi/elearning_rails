class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :topic
      t.string :location
      t.integer :roomNumber
      t.string :profesorName
      t.string :startDate
      t.string :endDate
      t.string :beginningTime
      t.string :endingTime
      t.references :student, null: false, foreign_key: true
      t.text :requirements

      t.timestamps
    end
  end
end
