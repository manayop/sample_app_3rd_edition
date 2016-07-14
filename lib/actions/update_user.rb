module Actions
  class UpdateUser
    def self.do user, data
      result = false
	  if user.update_attributes(data)
      	result = true
      end
      result
    end
  end
end