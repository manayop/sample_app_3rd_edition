module Services
  class Directory

    def self.microposts user_id, page_number
      user = Repos::Users.find user_id
      microposts = Repos::Users.microposts user, page_number
      Mapper.user_for_show user, microposts
    end
  end
end