require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(email: 'test@test.com', phone: '655444333') }

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
end
