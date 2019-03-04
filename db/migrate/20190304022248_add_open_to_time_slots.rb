class AddOpenToTimeSlots < ActiveRecord::Migration[5.2]
  def change
    add_column :time_slots, :is_open, :boolean
  end
end
