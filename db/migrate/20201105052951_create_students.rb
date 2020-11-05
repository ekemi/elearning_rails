class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :firstName
      t.string :lastName
      t.string :dateOfBirth
      t.string :address
      t.string :gender
      t.integer :phoneNumber
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
