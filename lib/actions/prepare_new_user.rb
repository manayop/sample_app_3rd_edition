module Actions
  class PrepareNewUser
    def self.do data=nil
      Repos::Users.sample data
    end
  end
end