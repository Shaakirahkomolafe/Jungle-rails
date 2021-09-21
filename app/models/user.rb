class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :password, length: { minimum: 8 }, if: :password_digest_changed?
  validate :validate_case_sensitive_emails
  validates :email, :uniqueness => {:case_sensitive => false}

  def validate_case_sensitive_emails
    if(self.email =~ /[A-Z]/) === 0
        errors.add(:email, "should not have capital letter")
    end 
  end
  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip)
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
 end
end
