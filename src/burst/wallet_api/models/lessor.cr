require "json"

class Burst::WalletApi::Models::Lessor
  include JSON::Serializable

  @[JSON::Field(key: "lessorRS")]
  property lessor_rs : String

  property lessor : String

  @[JSON::Field(key: "guaranteedBalanceNQT")]
  property guaranteed_balance_nqt : String
end
