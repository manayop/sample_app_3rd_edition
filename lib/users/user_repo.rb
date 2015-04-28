require 'common/repo'

module Repos
  class Users < Repo
    def methods
      []
    end

    def paginate page
      User.paginate(page: page)
    end

    def find id
       User.find id
    end

    def microposts user, page_number
      user.microposts.paginate(page: page_number)
    end

    def sample data
      return User.new if data.nil?
      User.new data
    end
  end
end