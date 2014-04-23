class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dob, :datetime
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :insurance, :string
  end
end
