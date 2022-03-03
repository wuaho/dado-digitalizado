require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'Paco', surname: 'Perez', email: 'test@test.com', phone: '655444333') }

  it 'should pass when valid' do
    expect(subject).to be_valid
  end

  describe 'validations' do
    describe 'email' do
      it 'must be present' do
        subject.email = nil
        expect(subject).to_not be_valid
      end
      it 'must have desired length' do
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
    it 'returns the user full name' do
      expect(subject.fullname).to eql('Paco Perez')
    end
    it 'returns only the name' do
      subject.surname = nil
      expect(subject.fullname).to eql('Paco')
    end
    it 'returns only the surname' do
      subject.name = nil
      expect(subject.fullname).to eql('Perez')
    end
  end
end
