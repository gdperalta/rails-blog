module ActivityGenerator
  class Error
    class InvalidEndpoint < StandardError
    end

    def self.map(code)
      case code
      when 404
        'Unauthorized request! Please try again'
      when 401
        'Please try again'
      else
        'Invalid Request'
      end
    end
  end
end
