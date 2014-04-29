class AddValidationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :validation, :string
    add_column :users, :validated, :boolean
    add_index :users, :validation
  end
end
