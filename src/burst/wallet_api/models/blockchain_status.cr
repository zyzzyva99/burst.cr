require "json"

class Burst::WalletApi::Models::BlockchainStatus
  include JSON::Serializable

  @[JSON::Field(key: "lastBlock")]
  property last_block : String

  property application : String

  @[JSON::Field(key: "isScanning")]
  property is_scanning : Bool

  @[JSON::Field(key: "cumulativeDifficulty")]
  property cumulative_difficulty : String

  @[JSON::Field(key: "lastBlockchainFeederHeight")]
  property last_blockchain_feeder_height : Int32

  @[JSON::Field(key: "numberOfBlocks")]
  property number_of_blocks : Int32

  property time : Int32

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32

  property version : String

  @[JSON::Field(key: "lastBlockchainFeeder")]
  property last_blockchain_feeder : String
end
