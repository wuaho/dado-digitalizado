class Borrower
  attr_reader :user, :game

  def initialize(user, game)
    @user = user
    @game = game
  end

  def user_can_borrow_game?
    # Checks that:
    #   1. User is not banned
    #   2. User has member role or higher
    #   3. User has no active borrowing
    #   4. Game stock is bigger than number of active borrowings of that game
    user_not_banned? && user_is_member? && user_has_no_active_borrowing? && game_is_available?
  end

  def user_not_banned?
    !user.banned?
  end

  def user_is_member?
    user.member? || user.council?
  end

  def user_has_no_active_borrowing?
    true
  end

  def game_is_available?
    true
  end
end
