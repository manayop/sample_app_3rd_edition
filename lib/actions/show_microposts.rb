require "users/user_dto"
require "common/mapper"
require 'users/directory'

module Actions
  class ShowMicroposts
    def self.do user_id, page_number
      Services::Directory.microposts user_id, page_number
    end
  end
end