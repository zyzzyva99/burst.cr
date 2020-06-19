require "json"
require "./transaction_type"
require "./peer_state"

class Burst::WalletApi::Models::Constants
  include JSON::Serializable

  @[JSON::Field(key: "maxBlockPayloadLength")]
  property max_block_payload_length : Int32

  @[JSON::Field(key: "genesisAccountId")]
  property genesis_account_id : String

  @[JSON::Field(key: "genesisBlockId")]
  property genesis_block_id : String

  @[JSON::Field(key: "transactionTypes")]
  property transaction_types : Array(TransactionType)

  @[JSON::Field(key: "peerStates")]
  property peer_states : Array(PeerState)

  @[JSON::Field(key: "maxArbitraryMessageLength")]
  property max_arbitrary_message_length : Int32

  @[JSON::Field(key: "requestTypes")]
  property request_types : JSON::Any # TODO: Needs its own model
end
