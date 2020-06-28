require "json"

class Burst::WalletApi::Models::GuaranteedBalance
  include JSON::Serializable

  @[JSON::Field(key: "guaranteedBalanceNQT")]
  property guaranteed_balance_nqt : String

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32
end
