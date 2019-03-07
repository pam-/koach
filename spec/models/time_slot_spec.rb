require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @coach = create(:coach)
    @time_slot = build(:time_slot)
  end
  
  context 'A time slot gets created:' do
    it 'exists' do
      @time_slot.save!
      expect(TimeSlot.where(id: @time_slot.id)).to exist
    end
  end

  context 'Associations' do
    it 'associates the right coach' do
      @time_slot.coach = @coach
      expect(@time_slot.coach).to equal @coach
    end
  end

  # todo: validate attributes
end
