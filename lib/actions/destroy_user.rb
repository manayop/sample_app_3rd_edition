module Actions
  class DestroyUser
    def self.do id
	  result_user = User.find(id)
	  result_user.destroy
    end
  end
end