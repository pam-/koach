require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @client = create(:client)
    @coach = create(:coach)
  end
  
  context 'A client gets created:' do
    it 'exists' do
      expect(User.where(name: @client.name)).to exist
    end

    it 'is not a coach' do
      expect(@client.is_coach).to be_falsey
    end
  end

  context 'A coach gets created:' do
    it 'exists' do
      expect(User.where(name: @coach.name)).to exist
    end

    it 'is a coach' do
      expect(@coach.is_coach).to be_truthy
    end
  end

  # todo: validate attributes
end
