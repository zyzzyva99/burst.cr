require "json"
require "./transfer"

class Burst::WalletApi::Models::Transfers
  include JSON::Serializable

  property transfers : Array(Transfer)

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32
end
