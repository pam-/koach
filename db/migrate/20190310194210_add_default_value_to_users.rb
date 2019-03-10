class AddDefaultValueToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :is_coach, :boolean, :default => false
  end
end
