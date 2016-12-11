require 'rails_helper'

module Contact
  shared_examples 'a valid contact' do
    it 'its Factory is valid' do
      expect(con).to be_valid
    end
  end

  RSpec.describe Contact, type: :model do
    context 'with John Doe' do
      it_behaves_like 'a valid contact' do
        let(:con) { FactoryGirl.create(:doe) }
      end
    end
  end
end
