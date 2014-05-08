class AddLateFeeToChart < ActiveRecord::Migration
  def change
    add_column :charts, :late_fee, :integer
  end
end
