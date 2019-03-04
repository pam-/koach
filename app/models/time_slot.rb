class TimeSlot < ApplicationRecord
  belongs_to :coach, class_name: 'User', foreign_key: 'coach_id'
  has_one :appointment

  %w(monday tuesday wednesday thursday friday saturday sunday).each do |day|
    scope day.to_sym, -> { where(:day => day) }
  end

  def formatted_from
    from.strftime("%l:%M %p")
  end

  def formatted_to
    to.strftime("%l:%M %p")
  end
end
