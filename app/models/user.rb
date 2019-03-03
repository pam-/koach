class User < ApplicationRecord
  has_many :received_appt_requests, class_name: 'Appointment', foreign_key: "coach_id"
  has_many :sent_appt_requests, class_name: 'Appointment', foreign_key: "client_id"
end
