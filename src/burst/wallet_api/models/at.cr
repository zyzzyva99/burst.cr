require "json"

class Burst::WalletApi::Models::At
  include JSON::Serializable

  @[JSON::Field(key: "atVersion")]
  property at_version : Int32

  property creator : String

  @[JSON::Field(key: "creatorRS")]
  property creator_rs : String

  property stopped : Bool

  @[JSON::Field(key: "machineCode")]
  property machine_code : String

  property description : String

  @[JSON::Field(key: "machineData")]
  property machine_data : String

  property frozen : Bool

  property finished : Bool

  property dead : Bool

  @[JSON::Field(key: "balanceNQT")]
  property balance_nqt : String

  @[JSON::Field(key: "nextBlock")]
  property next_block : Int32

  @[JSON::Field(key: "minActivation")]
  property min_activation : String

  property running : Bool

  property at : String

  property name : String

  @[JSON::Field(key: "atRS")]
  property at_rs : String

  @[JSON::Field(key: "prevBalanceNQT")]
  property prev_balance_nqt : String

  @[JSON::Field(key: "creationBlock")]
  property creation_block : Int32

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32?
end
