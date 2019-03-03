class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.references :coach
      t.references :client

      t.timestamps
    end
  end
end
