class CreateTimeSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :time_slots do |t|
      t.time :from
      t.time :to
      t.string :timezone
      t.integer :day
      t.references :coach

      t.timestamps
    end

    add_foreign_key :time_slots, :users, column: :coach_id, primary_key: :id
  end
end
