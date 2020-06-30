require "json"

class Burst::WalletApi::Models::State
  include JSON::Serializable

  @[JSON::Field(key: "numberOfPeers")]
  property number_of_peers : Int32?

  @[JSON::Field(key: "numberOfUnlockedAccounts")]
  property number_of_unlocked_accounts : Int32?

  @[JSON::Field(key: "numberOfTransfers")]
  property number_of_transfers : Int32?

  @[JSON::Field(key: "numberOfOrders")]
  property number_of_orders : Int32?

  @[JSON::Field(key: "numberOfTransactions")]
  property number_of_transactions : Int32?

  @[JSON::Field(key: "maxMemory")]
  property max_memory : Int32

  @[JSON::Field(key: "isScanning")]
  property is_scanning : Bool

  @[JSON::Field(key: "cumulativeDifficulty")]
  property cumulative_difficulty : String

  @[JSON::Field(key: "numberOfAssets")]
  property number_of_assets : Int32?

  @[JSON::Field(key: "freeMemory")]
  property free_memory : Int32

  @[JSON::Field(key: "availableProcessors")]
  property available_processors : Int32

  @[JSON::Field(key: "totalEffectiveBalanceNXT")]
  property total_effective_balance_nxt : Int32

  @[JSON::Field(key: "numberOfAccounts")]
  property number_of_accounts : Int32?

  @[JSON::Field(key: "numberOfBlocks")]
  property number_of_blocks : Int32?

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32

  property version : String

  @[JSON::Field(key: "numberOfBidOrders")]
  property number_of_bid_orders : Int32?

  @[JSON::Field(key: "lastBlock")]
  property last_block : String

  @[JSON::Field(key: "totalMemory")]
  property total_memory : Int32

  property application : String

  @[JSON::Field(key: "numberOfAliases")]
  property number_of_aliases : Int32?

  @[JSON::Field(key: "lastBlockchainFeederHeight")]
  property last_blockchain_feeder_height : Int32

  @[JSON::Field(key: "numberOfTrades")]
  property number_of_trades : Int32?

  property time : Int32

  @[JSON::Field(key: "numberOfAskOrders")]
  property number_of_ask_orders : Int32?

  @[JSON::Field(key: "lastBlockchainFeeder")]
  property last_blockchain_feeder : String
end
