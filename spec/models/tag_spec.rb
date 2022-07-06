require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:valid_tag_attributes) do
    {
      name: 'd&d'
    }
  end

  subject { described_class.new(valid_tag_attributes) }

  describe 'validations' do 
    it 'pass when all parameters are valid' do
      expect(subject).to be_valid
    end
    context 'when validating the name' do
      it 'returns false when is nil' do
        subject.name = nil
        expect(subject).to_not be_valid
      end
      it 'returns false when is empty' do
        subject.name = ''
        expect(subject).to_not be_valid
      end
      it 'returns false when length is < 3 chars' do
        subject.name = 'ab'
        expect(subject).to_not be_valid
      end
      it 'returns false when there is already a tag with that name' do
        create(:tag, name: 'd&d')
        expect(subject).to_not be_valid
      end
    end
  end
end
