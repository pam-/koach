class AppointmentsController < ApplicationController
  def welcome
    @coaches = User.where(is_coach: true)
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save_and_update_slot
      redirect_to root_path, flash: { success: "Successfully booked the appointment!"}
    else
      redirect_to root_path, flash: { error: "We couldn't book the appointment. Please reload and try again!"}
    end
  end

  protected

  def appointment_params
    params.require(:appointment).permit(:coach_id, :client_id, :time_slot_id, is_confirmed: false)
  end
end
