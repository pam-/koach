class UsersController < ApplicationController
  def show
    @appointments = @current_user.booked_appointments
  end
end
