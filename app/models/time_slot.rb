class TimeSlot < ApplicationRecord
  belongs_to :coach, class_name: 'User', foreign_key: 'coach_id'
  has_one :appointment
end
