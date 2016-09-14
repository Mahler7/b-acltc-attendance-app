class AddColumnToCohorts < ActiveRecord::Migration
  def change
    add_column :cohorts, :timezone, :string
  end
end
