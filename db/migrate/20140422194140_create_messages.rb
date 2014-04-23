class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :pein
      t.integer :recipient_pein
      t.string :subject
      t.string :content

      t.timestamps
    end

    add_index :messages, [:pein, :created_at]
  end
end
