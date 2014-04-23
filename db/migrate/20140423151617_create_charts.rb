class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.integer :user_id
      t.string :bp
      t.string :heart_rate
      t.integer :resp_rate
      t.integer :temp
      t.string :given_symptoms
      t.string :observed_symptoms
      t.string :comments
      t.string :diagnosis
      t.string :prognosis
      t.string :visit_purpose
      t.string :preconditions
      t.integer :height
      t.integer :weight
      t.string :verbal_instructions
      t.string :notes
      t.integer :lab_request
      t.integer :attachment_type

      t.timestamps
    end
  end
end
