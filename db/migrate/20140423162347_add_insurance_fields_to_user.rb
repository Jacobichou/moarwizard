class AddInsuranceFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :insur_grp_id, :integer
    add_column :users, :insur_policy_acc, :string
  end
end
