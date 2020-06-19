require "json"

class Burst::WalletApi::Models::Block
  include JSON::Serializable

  property block : String

  property height : Int32

  property generator : String

  @[JSON::Field(key: "generatorRS")]
  property generator_rs : String

  @[JSON::Field(key: "generatorPublicKey")]
  property generator_public_key : String

  property nonce : String

  @[JSON::Field(key: "scoopNum")]
  property scoop_num : Int32

  property timestamp : Int32

  @[JSON::Field(key: "numberOfTransactions")]
  property number_of_transactions : Int32

  @[JSON::Field(key: "totalAmountNQT")]
  property total_amount_nqt : String

  @[JSON::Field(key: "totalFeeNQT")]
  property total_fee_nqt : String

  @[JSON::Field(key: "blockReward")]
  property block_reward : String

  @[JSON::Field(key: "payloadLength")]
  property payload_length : Int32

  property version : Int32

  @[JSON::Field(key: "baseTarget")]
  property base_target : String

  @[JSON::Field(key: "previousBlock")]
  property previous_block : String

  @[JSON::Field(key: "nextBlock")]
  property next_block : String

  @[JSON::Field(key: "payloadHash")]
  property payload_hash : String

  @[JSON::Field(key: "generationSignature")]
  property generation_signature : String

  @[JSON::Field(key: "previousBlockHash")]
  property previous_block_hash : String

  @[JSON::Field(key: "blockSignature")]
  property block_signature : String

  property transactions : Array(String)
end
