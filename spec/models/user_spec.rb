require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_user_attributes) do
    {
      birthdate: Date.new(2001, 6, 17),
      email: 'test@test.com',
      name: 'Paco',
      password: '123456',
      phone: '655444333',
      surname: 'Perez'
    }
  end
  subject { described_class.new(valid_user_attributes) }

  describe 'validations' do
    it 'pass when all parameters are valid' do
      expect(subject).to be_valid
    end
    context 'when validating the email' do
      it 'returns false when is empty' do
        subject.email = nil
        expect(subject).to_not be_valid
      end
      it 'returns false when it has invalid format' do
        subject.email = 'thisIsNotAnEmail@what@what.com'
        expect(subject).to_not be_valid
      end
      context 'when checking its length' do
        it 'returns false when is less than 3' do
          subject.email = '@a'
          expect(subject).to_not be_valid
        end
        it 'returns false when is longer than 254' do
          subject.email = "#{'a' * 254}@test.com"
          expect(subject).to_not be_valid
        end
      end
    end
    context 'when validating the phone' do
      # it 'returns false when is empty' do
      #   subject.phone = nil
      #   expect(subject).to_not be_valid
      # end
      it 'returns false when it has invalid format' do
        subject.phone = '691255488102782'
        expect(subject).to_not be_valid
      end
    end
    context 'role' do
      it 'is default to non_enrolled when not declared' do
        expect(subject.role).to eql('non_enrolled')
      end
    end
  end
  describe '#fullname' do
    it 'returns the user full name' do
      expect(subject.fullname).to eql('Paco Perez')
    end
    it 'returns only the name when no surname' do
      subject.surname = nil
      expect(subject.fullname).to eql('Paco')
    end
    it 'returns only the surname when no name ' do
      subject.name = nil
      expect(subject.fullname).to eql('Perez')
    end
  end
  describe '#underage?' do
    before(:all) do
      travel_to Date.new(2022, 3, 4)
    end
    it 'returns false when age >= 18' do
      expect(subject.underage?).to be false
    end
    it 'returns true when age < 18' do
      subject.birthdate = Date.new(2010, 6, 17)
      expect(subject.underage?).to be true
    end
  end
end
