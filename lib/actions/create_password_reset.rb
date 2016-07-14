module Actions
  class CreatePasswordReset
    def self.do email
      user = User.find_by(email: email.downcase)
	    if user
        user.create_reset_digest
        user.send_password_reset_email
        message = "Email sent with password reset instructions"
      else
      	message = "Email address not found"
      end
      user    	
    end
  end
end