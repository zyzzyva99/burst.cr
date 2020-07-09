require "../api_exception"
require "../models/api_error"
require "./models/*"

module Burst::WalletApi::Block
  # Get data and metadata for the specified block. The block may be specified
  # by block ID, height, or timestamp. If `include_transactions` is true, a list of
  # transactions from the block will be included.
  def get_block(block : String? = nil, height : UInt64? = nil, timestamp : UInt64? = nil, include_transactions : Bool = false)
    if block.nil? && height.nil? && timestamp.nil?
      raise Burst::ApiException.new("no block specified to get_block")
    end

    params = {"includeTransactions" => include_transactions.to_s}
    params["block"] = block unless block.nil?
    params["height"] = height unless height.nil?
    params["timestamp"] = timestamp unless timestamp.nil?

    response = post(@wallet_uri, "getBlock", params)
    Models::Block.from_json(response.body)
  end

  # Get the block ID for the block at the given height.
  def get_block_id(height : UInt64)
    response = post(@wallet_uri, "getBlockId", {"height" => height.to_s})
    Models::BlockId.from_json(response.body)
  end

  # Get a list of full blocks in reverse block height order. The query may
  # optionally be scoped using the `first_index` parameter (0 is the last
  # block on the chain) and `last_index` parameter (1 is the second-to-last
  # block). If `include_transactions` is true, then full transaction information
  # will be included. By default, 100 blocks are retrieved.
  def get_blocks(first_index : UInt64? = nil, last_index : UInt64? = nil, include_transactions : Bool = false)
    params = {"includeTransactions" => include_transactions.to_s}
    params["firstIndex"] = first_index.to_s unless first_index.nil?
    params["lastIndex"] = last_index.to_s unless last_index.nil?

    response = post(@wallet_uri, "getBlocks", params)
    Models::BlockList.from_json(response.body)
  end

  # Get Economic Cluster block data. `timestamp` is the timestamp in seconds since
  # genesis block of the EC block, and defaults to the current timestamp. `require_block`
  # optionally specifies the block ID of a block that must be present for the call
  # to succeed, and `require_last_block` optionally specifies the block ID of a block
  # that must be last in the blockchain.
  def get_ec_block(timestamp : UInt64 = 0, require_block : String? = nil, require_last_block : String? = nil)
    params = {"timestamp" => timestamp.to_s}
    params["requireBlock"] = require_block.to_s unless require_block.nil?
    params["requireLastBlock"] = require_last_block.to_s unless require_last_block.nil?

    response = post(@wallet_uri, "getECBlock", params)
    Models::EcBlock.from_json(response.body)
  end
end
