class CreateTimeSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :time_slots do |t|
      t.datetime :from
      t.datetime :to
      t.references :coach
      t.references :client

      t.timestamps
    end
  end
end
