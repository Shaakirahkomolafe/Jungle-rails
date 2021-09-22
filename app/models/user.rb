class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :password, length: { minimum: 8 }, if: :password_digest_changed?
  validates :email, presence:true, uniqueness: true
   before_create {self.email = email.strip.downcase}

  # def validate_case_sensitive_emails
  #   self.email = self.email.strip.downcase
  #   # if(self.email =~ /[A-Z]/) === 0
  #   #     errors.add(:email, "should not have capital letter")
  #   end 
  # end
  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
 end
end
