class AddCheckedInToChart < ActiveRecord::Migration
  def change
    add_column :charts, :checked_in, :integer
  end
end
