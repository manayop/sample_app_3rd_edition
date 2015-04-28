module Infrastucture
  class UserModel
    def self.for model
      new(model)
    end

    def initialize model
      @model = model
    end

    def paginate
      
    end
    
  end
end