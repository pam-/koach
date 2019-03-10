class User < ApplicationRecord
  has_many :received_appointments, class_name: 'Appointment', foreign_key: 'coach_id'
  has_many :booked_appointments, class_name: 'Appointment', foreign_key: 'client_id'
  has_many :time_slots, foreign_key: 'coach_id'

  validates_presence_of :name
  validates_uniqueness_of :email, scope: :name
  validates :is_coach, inclusion: [true, false]

  def self.from_omniauth(auth_hash)
    return where(name: auth_hash.info.name).first_or_create do |user|
      user.name = auth_hash.info.name
      user.email = auth_hash.info.email
    end
  end
end
