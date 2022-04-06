class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: { admin: 0, non_enrolled: 1, council: 2, member: 3, banned: 5 }, _default: :non_enrolled

  has_many :borrowings
  has_many :reviews
  has_many :games, through: :borrowings
  has_one :membership, dependent: :destroy

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false,
                          message: 'There is already an account with this email' },
            length: { minimum: 3, maximum: 254 },
            format: { with: URI::MailTo::EMAIL_REGEXP,
                      message: 'The email does not have a valid format' }
  validates :phone,
            format: { with: /\A\d{9}\z/,
                      message: 'The phone number does not have a valid format' },
            allow_nil: true,
            allow_blank: true

  LEGAL_AGE = 18
  def fullname
    "#{name} #{surname}".strip
  end

  def underage?
    age < LEGAL_AGE
  end

  def ban!
    banned!
  end

  def active_for_authentication?
    super && active?
  end

  def inactive_message
    active? ? super : :locked
  end

  private

  def active?
    !banned?
  end

  def age
    today = Date.today

    today.year - birthdate.year - (((today.month > birthdate.month) ||
    today.month == birthdate.month && today.day >= birthdate.day) ? 0 : 1)
  end
end
