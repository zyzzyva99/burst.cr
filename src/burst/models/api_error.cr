require "json"

class Burst::Models::ApiError
  include JSON::Serializable

  @[JSON::Field(key: "errorCode")]
  property error_code : Int32

  @[JSON::Field(key: "errorDescription")]
  property error_description : String

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32?
end
