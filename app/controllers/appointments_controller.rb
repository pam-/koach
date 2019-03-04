class AppointmentsController < ApplicationController
  def welcome
    @coaches = User.where(is_coach: true)
  end

  def create
    # create appointment with time slot
    # edit time slot to false open
    # redirect to user appointments or render modal with confirmation (gotta remove the newly booked appointment from list)
  end
end
