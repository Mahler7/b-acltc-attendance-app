class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.datetime :arrived
      t.boolean :attended, default: false
      t.integer :lecture_id
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
