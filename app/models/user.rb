class User < ApplicationRecord
  has_many :received_appointments, class_name: 'Appointment', foreign_key: 'coach_id'
  has_many :booked_appointments, class_name: 'Appointment', foreign_key: 'client_id'
  has_many :time_slots, foreign_key: 'coach_id'

  validates_presence_of :name
  validates :is_coach, inclusion: [true, false]
end
