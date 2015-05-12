module Infrastucture
  class UserModel
    def self.for model
      new(model)
    end

    def initialize model
      @model = model
    end

    def paginate page
      @model.paginate(page: page)
    end
    
    def find id
       @model.find id
    end

    def sample data
      return @model.new if data.nil?
      @model.new data
    end
  end
  
end