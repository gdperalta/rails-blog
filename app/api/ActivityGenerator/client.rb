module ActivityGenerator
  class Client
    def self.randomize
      Request.call(http_method: 'get', endpoint: '/')
    end

    def self.type(type)
      Request.call(http_method: 'get', endpoint: "?type=#{type}")
    end
  end
end
