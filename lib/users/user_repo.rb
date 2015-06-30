require 'common/repo'

module Repos
  class Users < Repo
    def methods
      [
        :paginate,
        :find,
        :sample
      ]
    end


    def microposts user, page_number
      user.microposts.paginate(page: page_number)
    end

  end
end