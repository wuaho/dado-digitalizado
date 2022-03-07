require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(name: 'Paco', surname: 'Perez',
                        email: 'test@test.com', phone: '655444333', birthdate: Date.new(2001, 6, 17))
  end

  describe 'validations' do
    it 'pass when all parameters are valid' do
      expect(subject).to be_valid
    end
    describe 'email' do
      it 'is present' do
        subject.email = nil
        expect(subject).to_not be_valid
      end
      it 'doesn\'t have undesired length' do
        subject.email = '@a'
        expect(subject).to_not be_valid
        subject.email = '3OrpKCF8wp1Vg6iHLBaNXpUBinQLXPl9qnjR9b4KOGSfHaQlKSoxaCHCGeoIrjy7j0mUDQnfxLV11oXxEfq3iTbdQZymMos2QAbzf7zvxAuQyQOHfEgOxOeB1Qi6FkFKypE0zmoLEqNsmftyeoSAsW0EXlT6YxnhKtFMl0vYLmxRIpDMuLwlzwieNryy2GIWeCDYCMgXsNsFjmooqQmwyaKCFlZ1mc29VnpZteqFAhfc8ULWFkWtGhGb2IG3TtA
        @test.com'
        expect(subject).to_not be_valid
      end
      it 'has a valid format' do
        subject.email = 'thisIsNotAnEmail@what@what.com'
        expect(subject).to_not be_valid
      end
    end
    describe 'phone' do
      it 'is present' do
        subject.phone = nil
        expect(subject).to_not be_valid
      end
      it 'has valid format' do
        subject.phone = '691255488102782'
        expect(subject).to_not be_valid
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
  describe '#age' do
    before(:all) do
      travel_to Date.new(2022, 3, 4)
    end

    it 'returns today\'s user age' do
      expect(subject.age).to eql(20)
    end
  end
  describe '#underage?' do
    it 'returns false when age >= 18' do
      expect(subject.underage?).to be false
    end
    it 'returns true when age < 18' do
      subject.birthdate = Date.new(2010, 6, 17)
      expect(subject.underage?).to be true
    end
  end
end
