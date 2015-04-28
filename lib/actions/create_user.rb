module Actions
  class CreateUser
    def self.do data
      user = User.new(data)
      user.save!
      user.send_activation_email
      user
    end
  end
end