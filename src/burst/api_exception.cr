require "./models/api_error"

class Burst::ApiException < Exception
  property api_error : Burst::Models::ApiError?

  def initialize(message : String? = nil, cause : Exception? = nil, @api_error : Models::ApiError? = nil)
    super(message, cause)
  end
end
