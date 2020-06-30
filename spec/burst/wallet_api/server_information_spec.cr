require "../../spec_helper"

describe Burst::Client do
  describe "#get_blockchain_status" do
    it "should return a valid response" do
      status = client.get_blockchain_status
      status.should be_a(Burst::WalletApi::Models::BlockchainStatus)
      status.application.should eq("BRS")
    end
  end

  describe "#get_constants" do
    it "should return a valid response" do
      constants = client.get_constants
      constants.should be_a(Burst::WalletApi::Models::Constants)

      # These tests will only pass against the public testnet.
      constants.genesis_account_id.should eq("0")
      constants.genesis_block_id.should eq("3444294670862540038")
      constants.max_block_payload_length.should eq(179520)
    end
  end

  describe "#get_peers" do
    it "should return a valid response" do
      peer_list = client.get_peers
      peer_list.should be_a(Burst::WalletApi::Models::Peers)
      peer_list.peers.should be_a(Array(String))
      peer_list.peers.should_not be_empty
    end
  end

  describe "#get_peer" do
    it "should return a valid response when passed an existing peer" do
      peer_list = client.get_peers(active: true)
      peer = peer_list.peers[0]

      peer_info = client.get_peer(peer)
      peer_info.should be_a(Burst::WalletApi::Models::Peer)
      peer_info.announced_address.should eq(peer)
    end

    it "should raise an ApiException if passed an invalid peer" do
      expect_raises(Burst::ApiException) do
        client.get_peer("example.com")
      end
    end
  end

  describe "#get_my_info" do
    it "should return a valid response" do
      my_info = client.get_my_info
      my_info.should be_a(Burst::WalletApi::Models::MyInfo)
      my_info.host.should_not be_nil
      my_info.address.should_not be_nil
    end
  end

  describe "#get_state" do
    it "should return a valid response" do
      state = client.get_state
      state.should be_a(Burst::WalletApi::Models::State)
      state.last_block.should_not be_nil
      state.application.should eq("BRS")
    end
  end

  describe "#get_time" do
    it "should return a valid response" do
      time_response = client.get_time
      time_response.should be_a(Burst::WalletApi::Models::Time)
      time_response.time.should be > 0
    end
  end
end
