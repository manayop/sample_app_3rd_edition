require 'microposts/micropost_dto'

class Mapper
  def self.user_for_show user, microposts
    dto = UserDto.new
    dto.name = user.name
    dto.email = user.email
    dto.microposts = create_microposts microposts
    dto.id = user.id
    dto.following = []
    dto.followers = []
    dto
  end

  def self.create_microposts microposts
    result = []
    microposts.each do |micropost|
        dto = MicropostDto.new
        dto.id = micropost.id
        dto.content = micropost.content
        dto.created_at = micropost.created_at
        dto.picture = micropost.picture?
        result << dto
    end
    result
  end
end