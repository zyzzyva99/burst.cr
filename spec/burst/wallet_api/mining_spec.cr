require "../../spec_helper"

describe Burst::Client do
  describe "#get_mining_info" do
    it "should return a valid response" do
      mining_info = client.get_mining_info
      mining_info.should be_a(Burst::WalletApi::Models::MiningInfo)
      mining_info.generation_signature.should_not be_empty
    end
  end

  describe "#set_reward_recipient" do
    it "should return a response when called with valid parameters" do
      set_recipient_request = client.set_reward_recipient(recipient: TEST_ACCOUNT2_ID, secret_phrase: TEST_ACCOUNT_PASSPHRASE, fee_nqt: 10000000)
      set_recipient_request.should be_a(Burst::WalletApi::Models::CreateTransactionResponse)
      set_recipient_request.transaction.should_not be_nil
      set_recipient_request.transaction.fee_nqt.should eq("10000000")
    end

    it "should raise an error if the parameters are not valid" do
      expect_raises(Burst::ApiException) do
        client.set_reward_recipient(recipient: "", secret_phrase: "nope", fee_nqt: 0)
      end
    end
  end

  describe "#get_reward_recipient" do
    it "should return a valid response when passed a valid account ID" do
      recipient = client.get_reward_recipient(TEST_ACCOUNT_ID)
      recipient.should be_a(Burst::WalletApi::Models::RewardRecipient)
      recipient.reward_recipient.should_not be_empty
    end

    it "should return a valid response when passed an account with no reward recipient" do
      recipient = client.get_reward_recipient(TEST_ACCOUNT3_ID)
      recipient.should be_a(Burst::WalletApi::Models::RewardRecipient)
      recipient.reward_recipient.should eq(TEST_ACCOUNT3_ID)
    end

    it "should raise an error if the parameters are not valid" do
      expect_raises(Burst::ApiException) do
        client.get_reward_recipient("abcde")
      end
    end
  end

  describe "#get_accounts_with_reward_recipient" do
    it "should return a valid response when passed a valid account ID" do
      account_list = client.get_accounts_with_reward_recipient(TEST_ACCOUNT2_ID)
      account_list.should be_a(Burst::WalletApi::Models::AccountList)
      account_list.accounts.size.should be >= 1
      account_list.accounts.should contain(TEST_ACCOUNT2_ID)
    end

    it "should raise an error if the parameters are not valid" do
      expect_raises(Burst::ApiException) do
        client.get_accounts_with_reward_recipient("abcde")
      end
    end
  end

  describe "#submit_nonce" do
    it "should return a valid response on a valid submission" do
      response = client.submit_nonce(nonce: "100000", secret_phrase: TEST_ACCOUNT2_PASSPHRASE, account_id: TEST_ACCOUNT2_ID)
      response.should be_a(Burst::WalletApi::Models::SubmitNonceResponse)
      response.result.should eq("success")
    end

    it "should raise an error if the parameters are not valid" do
      expect_raises(Burst::ApiException) do
        client.submit_nonce(nonce: "abcde", secret_phrase: "", account_id: "")
      end
    end
  end
end
