require "../api_exception"
require "../models/api_error"
require "./models/*"

module Burst::WalletApi::Mining
  # Get current mining information
  def get_mining_info
    response = post(@wallet_uri, "getMiningInfo")
    Models::MiningInfo.from_json(response.body)
  end

  # Set the reward recipient for the account with the specified secret phrase.
  # The recipient is specified as an account ID.
  def set_reward_recipient(
    recipient : String,
    secret_phrase : String,
    public_key : String? = nil,
    fee_nqt : UInt64 = Burst::Client::DEFAULT_SEND_MONEY_FEE_NQT,
    deadline : Int = Burst::Client::DEFAULT_SEND_MONEY_DEADLINE,
    referenced_transaction_full_hash : String? = nil,
    broadcast : Bool? = nil,
    message : String? = nil,
    message_is_text : Bool? = nil,
    message_to_encrypt : String? = nil,
    message_to_encrypt_is_text : Bool? = nil,
    encrypted_message_data : String? = nil,
    encrypted_message_nonce : String? = nil,
    message_to_encrypt_to_self : String? = nil,
    message_to_encrypt_to_self_is_text : Bool? = nil,
    encrypt_to_self_message_data : String? = nil,
    encrypt_to_self_message_nonce : String? = nil,
    recipient_public_key : String? = nil
  )
    request = Models::SetRewardRecipientRequest.new(
      recipient,
      secret_phrase,
      public_key,
      fee_nqt.to_s,
      deadline.to_s,
      referenced_transaction_full_hash,
      broadcast.nil? ? nil : broadcast.to_s,
      message,
      message_is_text.nil? ? nil : message_is_text.to_s,
      message_to_encrypt,
      message_to_encrypt_is_text.nil? ? nil : message_to_encrypt_is_text.to_s,
      encrypted_message_data,
      encrypted_message_nonce,
      message_to_encrypt_to_self,
      message_to_encrypt_to_self_is_text.nil? ? nil : message_to_encrypt_to_self_is_text.to_s,
      encrypt_to_self_message_data,
      encrypt_to_self_message_nonce,
      recipient_public_key
    )
    set_reward_recipient(request)
  end

  # Set reward recipient as specified in the SetRewardRecipientRequest.
  def set_reward_recipient(request : Models::SetRewardRecipientRequest)
    response = post(@wallet_uri, "setRewardRecipient", request.to_params_hash)
    Models::CreateTransactionResponse.from_json(response.body)
  end

  # Get the reward recipient (as a numeric account ID) for the specified account.
  def get_reward_recipient(account_id : String)
    response = post(@wallet_uri, "getRewardRecipient", {"account" => account_id})
    Models::RewardRecipient.from_json(response.body)
  end

  # Get a list of accounts that have the specified reward recipient, as numeric
  # account IDs.
  def get_accounts_with_reward_recipient(account_id : String)
    response = post(@wallet_uri, "getAccountsWithRewardRecipient", {"account" => account_id})
    Models::AccountList.from_json(response.body)
  end

  # Submit a nonce for the current block, on behalf of the specified numeric account ID with
  # the specified secret phrase.
  def submit_nonce(nonce : String, secret_phrase : String, account_id : String)
    params = {
      "nonce"        => nonce,
      "secretPhrase" => secret_phrase,
      "accountId"    => account_id,
    }

    response = post(@wallet_uri, "submitNonce", params)
    Models::SubmitNonceResponse.from_json(response.body)
  end
end
