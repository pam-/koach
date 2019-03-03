class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.references :coach
      t.references :client

      t.timestamps
    end
    add_foreign_key :appointments, :users, column: :coach_id, primary_key: :id
    add_foreign_key :appointments, :users, column: :client_id, primary_key: :id
  end
end
