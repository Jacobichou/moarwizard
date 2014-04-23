class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :recipient_id
      t.string :subject
      t.string :content
      t.integer :attachment, default: 0

      t.timestamps
    end

    add_index :messages, [:user_id, :created_at]
  end
end
