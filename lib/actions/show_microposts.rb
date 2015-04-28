require "users/user_dto"
require "common/mapper"

module Actions
  class ShowMicroposts
    def self.do user_id, page_number
      user = Repos::Users.find user_id
      microposts = Repos::Users.microposts user, page_number
      dto = Mapper.user_for_show user, microposts
      dto
    end
  end
end