require "json"

class Burst::WalletApi::Models::Account
  include JSON::Serializable

  @[JSON::Field(key: "balanceNQT")]
  property balance_nqt : String

  @[JSON::Field(key: "unconfirmedBalanceNQT")]
  property unconfirmed_balance_nqt : String

  @[JSON::Field(key: "effectiveBalanceNXT")]
  property effective_balance_nxt : String

  @[JSON::Field(key: "forgedBalanceNQT")]
  property forged_balance_nqt : String

  @[JSON::Field(key: "guaranteedBalanceNQT")]
  property guaranteed_balance_nqt : String

  property account : String

  @[JSON::Field(key: "accountRS")]
  property account_rs : String

  @[JSON::Field(key: "publicKey")]
  property public_key : String

  property name : String

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32
end
