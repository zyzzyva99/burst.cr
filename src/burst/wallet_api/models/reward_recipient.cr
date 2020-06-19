require "json"

class Burst::WalletApi::Models::RewardRecipient
  include JSON::Serializable

  @[JSON::Field(key: "rewardRecipient")]
  property reward_recipient : String

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32
end
