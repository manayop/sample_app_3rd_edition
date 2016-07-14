module Actions
  class FollowUser
    def self.do user, followed_id
	    followed_user = User.find followed_id
	    user.follow(followed_user)
	    followed_user
    end
  end
end