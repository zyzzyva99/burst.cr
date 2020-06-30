require "../api_exception"
require "../models/api_error"
require "./models/*"

module Burst::WalletApi::ServerInformation
  # Get general information about the blockchain.
  def get_blockchain_status
    response = post(@wallet_uri, "getBlockchainStatus")
    Models::BlockchainStatus.from_json(response.body)
  end

  # Get constants reflecting the configuration of the blockchain.
  def get_constants
    response = post(@wallet_uri, "getConstants")
    Models::Constants.from_json(response.body)
  end

  # Get information about a peer, as specified by an IP address or domain
  # name, with an optional port.
  def get_peer(peer_address : String)
    response = post(@wallet_uri, "getPeer", {"peer" => peer_address})
    Models::Peer.from_json(response.body)
  end

  # Get a list of the server's peers, optionally filtered by active status and/or
  # state.
  def get_peers(active : Bool? = nil, state : String? = nil)
    params = Hash(String, String).new
    params["active"] = active.to_s unless active.nil?
    params["state"] = state unless state.nil?

    response = post(@wallet_uri, "getPeers", params)
    Models::Peers.from_json(response.body)
  end

  # Get information about the node serving the API.
  def get_my_info
    response = post(@wallet_uri, "getMyInfo")
    Models::MyInfo.from_json(response.body)
  end

  # Get information about the node and the network as a whole. If `include_counts`
  # is false, then the various "numberOf" fields will be omitted.
  def get_state(include_counts : Bool = true)
    response = post(@wallet_uri, "getState", {"includeCounts" => include_counts.to_s})
    Models::State.from_json(response.body)
  end

  # Get the current node time in seconds since the genesis block.
  def get_time
    response = post(@wallet_uri, "getTime")
    Models::Time.from_json(response.body)
  end
end
