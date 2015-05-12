require "users/user_dto"
require "common/mapper"
require "users/directory"

module Actions
  class ShowMicroposts
    def self.do user_id, page_number
      dto = Services::Directory.show user_id, page_number
      dto
    end
  end
end