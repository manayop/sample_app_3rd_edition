class Mapper
  def self.user_for_show user, microposts
    dto = UserDto.new
    dto.name = user.name
    dto.email = user.email
    dto.microposts = microposts
    dto.microposts = serialize microposts
    dto.id = user.id
    dto.following = user.following.count
    dto.followers = user.followers.count
    dto
  end

  private

  def self.serialize microposts
      posts = []
      microposts.each do |micropost|
        dto = MicropostDto.new
        dto.id = micropost.id
        dto.content = micropost.content
        dto.has_picture = micropost.picture?
        dto.picture_url = dto.has_picture ? micropost.picture.url : nil
        dto.created_at = micropost.created_at
        posts << MicropostDto.new
      end
     posts
  end
end

class MicropostDto
    attr_accessor :id, :content, :has_picture, :picture_url, :created_at
end

class PaginationDto
    attr_accessor :total_pages
end