require "json"

class Burst::WalletApi::Models::LongId
  include JSON::Serializable

  @[JSON::Field(key: "stringId")]
  property string_id : String

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32

  @[JSON::Field(key: "longId")]
  property long_id : String
end
