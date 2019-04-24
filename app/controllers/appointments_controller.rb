class AppointmentsController < ApplicationController

  def index
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save_and_update_slot
      respond_to do |format|
        format.json { render json: @appointment, status: :created }
        format.html { redirect_to root_path, flash: { success: "Successfully booked the appointment!"} }
      end
    else
      respond_to do |format|
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
        format.html { redirect_to root_path, flash: { error: "We couldn't book the appointment. Please reload and try again!"} }
      end
    end
  end

  protected

  def appointment_params
    params.require(:appointment).permit(:coach_id, :client_id, :time_slot_id, is_confirmed: false)
  end
end
