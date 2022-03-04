require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'Paco', surname: 'Perez', email: 'test@test.com', phone: '655444333') }

  describe 'validations' do
    it 'should pass when all parameters are valid' do
      expect(subject).to be_valid
    end
    describe 'email' do
      it 'must be present' do
        subject.email = nil
        expect(subject).to_not be_valid
      end
      it 'must not have undesired length' do
        subject.email = '@a'
        expect(subject).to_not be_valid
        subject.email = '3OrpKCF8wp1Vg6iHLBaNXpUBinQLXPl9qnjR9b4KOGSfHaQlKSoxaCHCGeoIrjy7j0mUDQnfxLV11oXxEfq3iTbdQZymMos2QAbzf7zvxAuQyQOHfEgOxOeB1Qi6FkFKypE0zmoLEqNsmftyeoSAsW0EXlT6YxnhKtFMl0vYLmxRIpDMuLwlzwieNryy2GIWeCDYCMgXsNsFjmooqQmwyaKCFlZ1mc29VnpZteqFAhfc8ULWFkWtGhGb2IG3TtA
        @test.com'
        expect(subject).to_not be_valid
      end
      it 'must have valid format' do
        subject.email = 'thisIsNotAnEmail@what@what.com'
        expect(subject).to_not be_valid
      end
    end
    describe 'phone' do
      it 'must be present' do
        subject.phone = nil
        expect(subject).to_not be_valid
      end
      it 'must have valid format' do
        subject.phone = '691255488102782'
        expect(subject).to_not be_valid
      end
    end
  end
  describe '#fullname' do
    it 'must return the user full name' do
      expect(subject.fullname).to eql('Paco Perez')
    end
    it 'must return only the name when no surname' do
      subject.surname = nil
      expect(subject.fullname).to eql('Paco')
    end
    it 'must return only the surname when no name ' do
      subject.name = nil
      expect(subject.fullname).to eql('Perez')
    end
  end
end
