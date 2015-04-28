module Actions
  class ShowUsers
    def self.do page
      Repos::Users.paginate page
    end
  end
end
