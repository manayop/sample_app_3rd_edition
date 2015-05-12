  class UserDto
    attr_accessor :name, :email, :following, :followers, :id, :microposts

    def to_model
      raise "ActionView"
    end

    def persisted?
      true
    end

    def total_pages
      2
    end

    def current_page
      1
    end

  end