require "../../spec_helper"

# Some of these tests may fail unless run against the public testnet.
describe Burst::Client do
  describe "#get_block" do
    it "should include an array of Transaction objects if include_transactions is true" do
      block = client.get_block(block: "15808868094090898269", include_transactions: true)
      block.should be_a(Burst::WalletApi::Models::Block)
      block.height.should eq(187085)
      block.transactions.should_not be_empty
      block.transactions[0].should be_a(Burst::WalletApi::Models::Transaction)
      block.number_of_transactions.should eq(1)
    end

    it "should include an array of String transaction IDs if include_transactions is false" do
      block = client.get_block(block: "15808868094090898269", include_transactions: false)
      block.should be_a(Burst::WalletApi::Models::Block)
      block.height.should eq(187085)
      block.transactions.should_not be_empty
      block.transactions[0].should be_a(String)
      block.number_of_transactions.should eq(1)
    end

    it "should raise an ApiException if no block is specified" do
      expect_raises(Burst::ApiException) do
        client.get_block
      end
    end

    it "should raise an ApiException if an invalid block is specified" do
      expect_raises(Burst::ApiException) do
        client.get_block(block: "not actually a block")
      end
    end
  end

  describe "#get_block_id" do
    it "should return the correct block ID if passed a valid height" do
      block_id = client.get_block_id(187085)
      block_id.should be_a(Burst::WalletApi::Models::BlockId)
      block_id.block.should eq("15808868094090898269")
    end

    it "should raise an ApiException if an invalid height is specified" do
      expect_raises(Burst::ApiException) do
        client.get_block_id(99999999999999)
      end
    end
  end

  describe "#get_blocks" do
    it "should return the requested blocks if valid blocks are specified" do
      block_list = client.get_blocks(first_index: 0, last_index: 2)
      block_list.should be_a(Burst::WalletApi::Models::BlockList)
      block_list.blocks.size.should eq(3)
      block_list.blocks[0].should be_a(Burst::WalletApi::Models::Block)
    end
  end

  describe "#get_ec_block" do
    it "should return EC block info if parameters are valid" do
      ec_block = client.get_ec_block
      ec_block.should be_a(Burst::WalletApi::Models::EcBlock)
      ec_block.ec_block_height.should be > 0
    end

    it "should raise an ApiException if the parameters are not valid" do
      expect_raises(Burst::ApiException) do
        client.get_ec_block(1) # Too far in the past
      end
    end
  end
end
