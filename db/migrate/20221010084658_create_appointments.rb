class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.integer :patient_id
      t.integer :doctor_id
      t.datetime :start
      t.datetime :end
      t.text :reason

      t.timestamps
    end
  end
end
