require "json"
require "./subscription"

class Burst::WalletApi::Models::Subscriptions
  include JSON::Serializable

  property subscriptions : Array(Subscription)

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32
end
