class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :password_digest
      t.string :user_type
      t.integer :cohort_id

      t.timestamps null: false
    end
  end
end
