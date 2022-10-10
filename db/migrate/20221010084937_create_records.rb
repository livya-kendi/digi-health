class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.datetime :last_record
      t.integer :patient_id
      t.integer :doctor_id
      t.text :medication

      t.timestamps
    end
  end
end
