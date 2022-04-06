require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:valid_review_attributes) do
    {
      title: 'This game is really fun!',
      description: 'This is the best game of my life. I cant wait to ',
      rating: 2,
      user: build(:user),
      game: build(:game)
    }
  end
  subject { described_class.new(valid_review_attributes) }
  describe 'validations' do
    it 'pass when all parameters are valid' do
      expect(subject).to be_valid
    end
    context 'when validating the title\'s length' do
      it 'returns false when is longer than 70' do
        subject.title = ('a' * 71).to_s
        expect(subject).to_not be_valid
      end
      it 'returns false when is shorter than 2' do
        subject.title = 'a'
        expect(subject).to_not be_valid
      end
    end
    context 'when validating the description\'s length' do
      it 'returns false when is longer than 2000' do
        subject.description = ('a' * 2001).to_s
        expect(subject).to_not be_valid
      end
    end
    context 'when validating the rating' do
      it 'returns false when is not an integer' do
        subject.rating = 2.0
        expect(subject).to_not be_valid
      end
      it 'returns false when the value is < 0 ' do
        subject.rating = -1
        expect(subject).to_not be_valid
      end
      it 'returns false when the value is > 5 ' do
        subject.rating = 6
        expect(subject).to_not be_valid
      end
    end
  end
end
