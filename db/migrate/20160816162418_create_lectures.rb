class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.text :notes
      t.integer :cohort_id

      t.timestamps null: false
    end
  end
end
