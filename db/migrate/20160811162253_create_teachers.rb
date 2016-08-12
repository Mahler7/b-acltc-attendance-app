class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :user_type
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
