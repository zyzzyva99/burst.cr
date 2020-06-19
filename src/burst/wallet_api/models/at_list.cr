require "json"
require "./at"

class Burst::WalletApi::Models::AtList
  include JSON::Serializable

  property ats : Array(At)

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32
end
