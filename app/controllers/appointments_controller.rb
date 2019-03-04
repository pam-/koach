class AppointmentsController < ApplicationController
  def welcome
    @coaches = User.where(is_coach: true)
    @time_slots = TimeSlot.all
  end
end
