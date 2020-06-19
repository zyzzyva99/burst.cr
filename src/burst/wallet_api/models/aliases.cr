require "json"
require "./alias"

class Burst::WalletApi::Models::Aliases
  include JSON::Serializable

  property aliases : Array(Alias)

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32
end
