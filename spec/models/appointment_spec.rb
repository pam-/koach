require 'rails_helper'

RSpec.describe Appointment, type: :model do
  before do
    @coach = create(:coach)
    @client = create(:client)
    @time_slot = create(:time_slot)
    @appointment = create(:appointment)
  end
  
  context 'A time slot gets created:' do

    it 'is not valid without the right associations' do
      expect(build(:appointment, coach: nil)).to_not be_valid
    end

    it 'exists' do
      expect(Appointment.where(id: @appointment.id)).to exist
    end
  end
end
