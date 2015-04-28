class Mapper
  def self.user_for_show user, microposts
    dto = UserDto.new
    dto.name = user.name
    dto.email = user.email
    dto.microposts = microposts
    dto.id = user.id
    dto.following = user.following
    dto.followers = user.followers
    dto
  end
end