class Appointment < ApplicationRecord
  belongs_to :coach, class_name: 'User', foreign_key: 'coach_id'
  belongs_to :client, class_name: 'User', foreign_key: 'client_id'
  belongs_to :time_slot

  validates_presence_of :coach, :client, :time_slot

  def save_and_update_slot
    Appointment.transaction do
      self.save!
      self.time_slot.update!(is_open: false)
    end
  end
end
