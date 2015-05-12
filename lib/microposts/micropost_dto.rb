class MicropostDto
  attr_accessor :id, :content, :created_at, :picture

  def created_at
    Time.now
  end

  def picture?
    @picture
  end
end