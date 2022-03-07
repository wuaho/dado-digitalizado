class User < ApplicationRecord
  enum rol: { admin: 0, default: 1, council: 2, member: 3, non_enrolled: 4, banned: 5 }
  validates :rol,
            presence: true,
            inclusion: { in: %w[admin council member non_enrolled banned] }
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false,
                          message: 'There is already an account with this email' },
            length: { minimum: 3, maximum: 254 },
            format: { with: URI::MailTo::EMAIL_REGEXP,
                      message: 'The email does not have a valid format' }
  validates :phone,
            presence: true,
            format: { with: /\A\d{9}\z/,
                      message: 'The phone number does not have a valid format' }

  LEGAL_AGE = 18
  def fullname
    "#{name} #{surname}".strip
  end

  def underage?
    age < LEGAL_AGE
  end

  private

  def age
    today = Date.today

    today.year - birthdate.year - (((today.month > birthdate.month) ||
    today.month == birthdate.month && today.day >= birthdate.day) ? 0 : 1)
  end
end
