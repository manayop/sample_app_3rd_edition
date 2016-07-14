module Actions
  class UpdateUser
    def self.do user, data
      message = nil
	  if user.update_attributes(data)
      	message = "Profile updated"
      end
      message    	
    end
  end
end