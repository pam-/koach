class CreateTimeSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :time_slots do |t|
      t.datetime :from
      t.datetime :to
      t.references :coach
      t.references :client

      t.timestamps
    end

    add_foreign_key :time_slots, :users, column: :coach_id, primary_key: :id
    add_foreign_key :time_slots, :users, column: :client_id, primary_key: :id
  end
end
