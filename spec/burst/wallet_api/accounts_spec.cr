require "../../spec_helper"

describe Burst::Client do
  describe "#get_account" do
    it "should return a response when queried with a valid account ID" do
      account_info = client.get_account(TEST_RS_ACCOUNT_ID)
      account_info.should be_a(Burst::WalletApi::Models::Account)
      account_info.account.should eq(TEST_ACCOUNT_ID)
      account_info.account_rs.should eq(TEST_RS_ACCOUNT_ID)
    end

    it "should raise an error if the account ID is not found" do
      expect_raises(Burst::ApiException) do
        client.get_account("abcde")
      end
    end
  end

  describe "#get_account_block_ids" do
    it "should return a response when queried with a valid account ID" do
      account_block_ids = client.get_account_block_ids(TEST_RS_ACCOUNT_ID)
      account_block_ids.should be_a(Burst::WalletApi::Models::AccountBlockIds)
      account_block_ids.block_ids.should_not be_nil
    end

    it "should raise an error if the account ID is not found" do
      expect_raises(Burst::ApiException) do
        client.get_account_block_ids("abcde")
      end
    end
  end

  describe "#get_account_blocks" do
    it "should return a response when queried with a valid account ID" do
      account_blocks = client.get_account_blocks(TEST_RS_ACCOUNT_ID)
      account_blocks.should be_a(Burst::WalletApi::Models::BlockList)
      account_blocks.blocks.should_not be_nil
    end

    it "should raise an error if the account ID is not found" do
      expect_raises(Burst::ApiException) do
        client.get_account_blocks("abcde")
      end
    end
  end

  describe "#get_account_id" do
    it "should return a correct response when queried with a secret phrase" do
      account_id = client.get_account_id(secret_phrase: TEST_ACCOUNT_PASSPHRASE)
      account_id.should be_a(Burst::WalletApi::Models::AccountId)
      account_id.account.should eq(TEST_ACCOUNT_ID)
      account_id.account_rs.should eq(TEST_RS_ACCOUNT_ID)
      account_id.public_key.should eq(TEST_ACCOUNT_PUBLIC_KEY)
    end

    it "should return a correct response when queried with a secret phrase" do
      account_id = client.get_account_id(public_key: TEST_ACCOUNT_PUBLIC_KEY)
      account_id.should be_a(Burst::WalletApi::Models::AccountId)
      account_id.account.should eq(TEST_ACCOUNT_ID)
      account_id.account_rs.should eq(TEST_RS_ACCOUNT_ID)
      account_id.public_key.should eq(TEST_ACCOUNT_PUBLIC_KEY)
    end

    it "should raise an ArgumentError if neither a secret phrase nor a public key is specified" do
      expect_raises(ArgumentError) do
        client.get_account_id
      end
    end

    it "should raise an error if the account ID is not found" do
      expect_raises(Burst::ApiException) do
        client.get_account_id(public_key: "invalidkey")
      end
    end
  end

  describe "#get_account_lessors" do
    it "should return a response when queried with a valid account ID" do
      account_lessors = client.get_account_lessors(TEST_RS_ACCOUNT_ID)
      account_lessors.should be_a(Burst::WalletApi::Models::AccountLessors)
      account_lessors.lessors.should_not be_nil
      account_lessors.account_rs.should eq(TEST_RS_ACCOUNT_ID)
      account_lessors.account.should eq(TEST_ACCOUNT_ID)
    end

    it "should raise an error if the account ID is not found" do
      expect_raises(Burst::ApiException) do
        client.get_account_lessors("abcde")
      end
    end
  end

  describe "#get_account_public_key" do
    it "should return a response when queried with a valid account ID" do
      account_key = client.get_account_public_key(TEST_RS_ACCOUNT_ID)
      account_key.should be_a(Burst::WalletApi::Models::PublicKey)
      account_key.public_key.should eq(TEST_ACCOUNT_PUBLIC_KEY)
    end

    it "should raise an error if the account ID is not found" do
      expect_raises(Burst::ApiException) do
        client.get_account_public_key("abcde")
      end
    end
  end

  describe "#get_account_transaction_ids" do
    it "should return a response when queried with a valid account ID" do
      account_transaction_ids = client.get_account_transaction_ids(TEST_RS_ACCOUNT_ID)
      account_transaction_ids.should be_a(Burst::WalletApi::Models::AccountTransactionIds)
      account_transaction_ids.transaction_ids.should_not be_nil
    end

    it "should raise an error if the account ID is not found" do
      expect_raises(Burst::ApiException) do
        client.get_account_transaction_ids("abcde")
      end
    end
  end

  describe "#get_account_transactions" do
    it "should return a response when queried with a valid account ID" do
      account_transactions = client.get_account_transactions(TEST_RS_ACCOUNT_ID)
      account_transactions.should be_a(Burst::WalletApi::Models::TransactionList)
      account_transactions.transactions.should_not be_nil
    end

    it "should raise an error if the account ID is not found" do
      expect_raises(Burst::ApiException) do
        client.get_account_transactions("abcde")
      end
    end
  end

  describe "#get_balance" do
    it "should return a response when queried with a valid account ID" do
      balance = client.get_balance(TEST_RS_ACCOUNT_ID)
      balance.should be_a(Burst::WalletApi::Models::Balance)
      balance.balance_nqt.to_i64.should_not eq(0)
    end

    it "should raise an error if the account ID is not found" do
      expect_raises(Burst::ApiException) do
        client.get_balance("abcde")
      end
    end
  end

  describe "#get_guaranteed_balance" do
    it "should return a response when queried with a valid account ID" do
      guaranteed_balance = client.get_guaranteed_balance(TEST_RS_ACCOUNT_ID)
      guaranteed_balance.should be_a(Burst::WalletApi::Models::GuaranteedBalance)
      guaranteed_balance.guaranteed_balance_nqt.to_i64.should_not eq(0)
    end

    it "should raise an error if the account ID is not found" do
      expect_raises(Burst::ApiException) do
        client.get_guaranteed_balance("abcde")
      end
    end
  end

  describe "#get_unconfirmed_transaction_ids" do
    it "should return a response when queried with a valid account ID" do
      unconfirmed_tx_ids = client.get_unconfirmed_transaction_ids(TEST_RS_ACCOUNT_ID)
      unconfirmed_tx_ids.should be_a(Burst::WalletApi::Models::UnconfirmedTransactionIds)
      unconfirmed_tx_ids.unconfirmed_transaction_ids.should_not be_nil
    end

    it "should not raise an error if the account ID is not found" do
      unconfirmed_tx_ids = client.get_unconfirmed_transaction_ids("abcde")
    end
  end

  describe "#get_unconfirmed_transactions" do
    it "should return a response when queried with a valid account ID" do
      unconfirmed_txns = client.get_unconfirmed_transactions(TEST_RS_ACCOUNT_ID)
      unconfirmed_txns.should be_a(Burst::WalletApi::Models::UnconfirmedTransactions)
      unconfirmed_txns.unconfirmed_transactions.should_not be_nil
    end

    it "should not raise an error if the account ID is not found" do
      client.get_unconfirmed_transactions("abcde")
    end
  end

  describe "#send_money" do
    it "should return a response when called with valid parameters" do
      transaction_response = client.send_money(recipient: TEST_ACCOUNT2_ID, amount_nqt: 100000000, secret_phrase: TEST_ACCOUNT_PASSPHRASE, fee_nqt: 10000000)
      transaction_response.should be_a(Burst::WalletApi::Models::CreateTransactionResponse)
      transaction_response.transaction.should_not be_nil
      transaction_response.transaction.fee_nqt.should eq("10000000")
    end

    it "should raise an error if the parameters are not valid" do
      expect_raises(Burst::ApiException) do
        client.send_money(recipient: TEST_ACCOUNT2_ID, amount_nqt: 0, secret_phrase: TEST_ACCOUNT_PASSPHRASE, fee_nqt: 0)
      end
    end
  end

  describe "#send_money_multi" do
    it "should return a response when called with valid parameters" do
      transactions = {
        TEST_ACCOUNT2_ID => 100000000_u64,
        TEST_ACCOUNT3_ID => 100000000_u64,
      }
      multi_response = client.send_money_multi(recipients: transactions, secret_phrase: TEST_ACCOUNT_PASSPHRASE, fee_nqt: 10000000)
      multi_response.should be_a(Burst::WalletApi::Models::CreateTransactionResponse)
      multi_response.transaction.should_not be_nil
      multi_response.transaction.fee_nqt.should eq("10000000")
    end

    it "should raise an error if the parameters are not valid" do
      expect_raises(Burst::ApiException) do
        client.send_money_multi(recipients: Hash(String, UInt64).new, secret_phrase: TEST_ACCOUNT_PASSPHRASE, fee_nqt: 0)
      end
    end
  end

  describe "#send_money_multi_same" do
    it "should return a response when called with valid parameters" do
      account_ids = [TEST_ACCOUNT2_ID, TEST_ACCOUNT3_ID]
      multi_response = client.send_money_multi_same(recipients: account_ids, amount_nqt: 100000000, secret_phrase: TEST_ACCOUNT_PASSPHRASE, fee_nqt: 10000000)
      multi_response.should be_a(Burst::WalletApi::Models::CreateTransactionResponse)
      multi_response.transaction.should_not be_nil
      multi_response.transaction.fee_nqt.should eq("10000000")
    end

    it "should raise an error if the parameters are not valid" do
      expect_raises(Burst::ApiException) do
        client.send_money_multi_same(recipients: [] of String, amount_nqt: 0, secret_phrase: TEST_ACCOUNT_PASSPHRASE, fee_nqt: 0)
      end
    end
  end

  describe "#send_money_multi_same" do
    it "should return a response when called with valid parameters" do
      account_ids = [TEST_ACCOUNT2_ID, TEST_ACCOUNT3_ID]
      multi_response = client.send_money_multi_same(recipients: account_ids, amount_nqt: 100000000, secret_phrase: TEST_ACCOUNT_PASSPHRASE, fee_nqt: 10000000)
      multi_response.should be_a(Burst::WalletApi::Models::CreateTransactionResponse)
      multi_response.transaction.should_not be_nil
      multi_response.transaction.fee_nqt.should eq("10000000")
    end

    it "should raise an error if the parameters are not valid" do
      expect_raises(Burst::ApiException) do
        client.send_money_multi_same(recipients: [] of String, amount_nqt: 0, secret_phrase: TEST_ACCOUNT_PASSPHRASE, fee_nqt: 0)
      end
    end
  end

  describe "#set_account_info" do
    it "should return a response when called with valid parameters" do
      description = "Hey, looks like we ran tests at #{Time.utc.to_s}"
      set_info_response = client.set_account_info(name: "burst.cr test account", description: description, secret_phrase: TEST_ACCOUNT_PASSPHRASE, fee_nqt: 10000000)
      set_info_response.should be_a(Burst::WalletApi::Models::CreateTransactionResponse)
      set_info_response.transaction.should_not be_nil
      set_info_response.transaction.fee_nqt.should eq("10000000")
    end

    it "should raise an error if the parameters are not valid" do
      expect_raises(Burst::ApiException) do
        client.set_account_info(name: "", description: "", secret_phrase: "nope", fee_nqt: 0)
      end
    end
  end
end
