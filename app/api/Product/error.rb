module Product
  class Error
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
