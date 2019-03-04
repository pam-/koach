class TimeSlotsController < ApplicationController
  def index
    @coaches = User.where(is_coach: true)
    @appointment = Appointment.new
  end
end
