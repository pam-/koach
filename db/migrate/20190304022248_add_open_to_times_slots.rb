class AddOpenToTimesSlots < ActiveRecord::Migration[5.2]
  def change
    add_column :times_slots, :is_open, :boolean
  end
end
