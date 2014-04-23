class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :user_id
      t.integer :type
      t.integer :attachment
      t.string :purpose
      t.string :tests_performed
      t.string :tests_request
      t.string :included_specimen
      t.string :lab_notes
      t.string :request_notes

      t.timestamps
    end
  end
end
