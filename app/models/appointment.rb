class Appointment < ApplicationRecord
  belongs_to :coach
  belongs_to :client
  belongs_to :timeslot
end
