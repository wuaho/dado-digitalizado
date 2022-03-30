require 'rails_helper'

RSpec.describe Borrower do
  let(:user) { build(:user) }
  let(:game) { build(:game) }
  subject { described_class.new(user, game) }
  describe '#user_can_borrow_game?' do
    it 'returns true if user can borrow game' do
      expect(subject.user_can_borrow_game?).to be true
    end
    context 'when user is banned' do
      let(:banned_user) { build(:user, role: 'banned') }
      subject { described_class.new(banned_user, game) }

      it 'returns false' do
        expect(subject.user_can_borrow_game?).to be false
      end
    end
    context 'when user is not a member' do
      let(:non_enrolled_user) { build(:user, role: 'non_enrolled') }
      subject { described_class.new(non_enrolled_user, game) }
      it 'returns false' do
        expect(subject.user_can_borrow_game?).to be false
      end
    end
    context 'when user already has an active borrowing' do
      before { create(:borrowing, user: user) }
      it 'returns false' do
        expect(subject.user_can_borrow_game?).to be false
      end
    end
    context 'when game is not available' do
      before { create(:borrowing, game: game) }
      it 'returns false' do
        expect(subject.user_can_borrow_game?).to be false
      end
    end
  end
end
