module Actions
  class ActivateUser
    def self.do id, email
	    user = User.find_by(email: email)
	    if user && !user.activated? && user.authenticated?(:activation, id)
	      user.activate
	    end
	    user
    end
  end
end