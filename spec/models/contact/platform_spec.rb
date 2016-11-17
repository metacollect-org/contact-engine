require 'rails_helper'

module Contact
  shared_examples 'a valid platform' do

    it 'its Factory is valid' do
      expect(plat).to be_valid
    end

    context 'is invalid when' do
      context '@uid is' do
        it 'nil' do
          plat.uid = nil
          expect(plat).not_to be_valid
        end

        it 'empty' do
          plat.uid = ''
          expect(plat).not_to be_valid
        end

        it 'too short' do
          plat.uid = 'ab'
          expect(plat).not_to be_valid
        end

        it 'too long' do
          plat.uid = 'a' * 33
          expect(plat).not_to be_valid
        end

        it 'uppercase' do
          plat.uid.upcase!
          expect(plat).not_to be_valid
        end
      end
    end

    context '@uid uniqueness' do
      it 'record has the given @uid' do
        expect(plat.uid).to eq(uid)
      end

      it 'is violated by another model with the same @uid' do
        expect(plat).to be_valid
        expect(second).not_to be_valid
      end

      it 'is fulfilled by another model with a different @uid' do
        expect(plat).to be_valid
        second.uid = 'snafu'
        expect(second).to be_valid
      end
    end
  end

  shared_examples 'an ActiveRecord with proper CRUD' do
    it 'has no records before creation' do
      expect(Platform.count).to eq(0)
    end

    it 'has records after creation' do
      plat  # create object
      expect(Platform.count).to eq(plat_count)
    end

    it 'has no records after destruction' do
      plat.destroy
      expect(Platform.count).to eq(0)
    end
  end

  RSpec.describe Platform, type: :model do
    context 'diaspora*' do
      it_behaves_like 'a valid platform' do
        let(:plat) { FactoryGirl.create(:diaspora) }
        let(:second) { FactoryGirl.build(:diaspora) }
        let(:uid) { 'diaspora' }
      end

      it_behaves_like 'an ActiveRecord with proper CRUD' do
        let(:plat) { FactoryGirl.create(:diaspora) }
        let(:plat_count) { 1 }
      end
    end

    context 'E-Mail' do
      it_behaves_like 'a valid platform' do
        let(:plat) { FactoryGirl.create(:email) }
        let(:second) { FactoryGirl.build(:email) }
        let(:uid) { 'email' }
      end

      it_behaves_like 'an ActiveRecord with proper CRUD' do
        let(:plat) { FactoryGirl.create(:email) }
        let(:plat_count) { 1 }
      end
    end
  end
end
