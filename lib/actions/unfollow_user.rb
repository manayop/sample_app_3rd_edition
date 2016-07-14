module Actions
  class UnfollowUser
    def self.do user, unfollowed_id
	    followed_user = Relationship.find(unfollowed_id).followed
	    user.unfollow(followed_user)
	    followed_user
    end
  end
end