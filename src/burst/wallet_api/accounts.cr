require "../api_exception"
require "../models/api_error"
require "./models/*"

module Burst::WalletApi::Accounts
  # Get information about the specified account.
  def get_account(account_id : String)
    response = post(@wallet_uri, "getAccount", {"account" => account_id})
    Models::Account.from_json(response.body)
  end

  # Get a list of the block IDs forged by the specified account, if any.
  # A starting timestamp and zero-based first and last indices may optionally
  # be specified.
  def get_account_block_ids(account_id : String, timestamp : Int? = nil, first_index : Int? = nil, last_index : Int? = nil)
    params = {"account" => account_id}
    params["timestamp"] = timestamp.to_s unless timestamp.nil?
    params["firstIndex"] = first_index.to_s unless first_index.nil?
    params["lastIndex"] = last_index.to_s unless last_index.nil?

    response = post(@wallet_uri, "getAccountBlockIds", params)
    Models::AccountBlockIds.from_json(response.body)
  end

  # Get the actual blocks forged by the specified account, if any.
  # A starting timestamp and zero-based first and last indices may optionally
  # be specified.
  def get_account_blocks(account_id : String, timestamp : Int? = nil, first_index : Int? = nil, last_index : Int? = nil)
    params = {"account" => account_id}
    params["timestamp"] = timestamp.to_s unless timestamp.nil?
    params["firstIndex"] = first_index.to_s unless first_index.nil?
    params["lastIndex"] = last_index.to_s unless last_index.nil?

    response = post(@wallet_uri, "getAccountBlocks", params)
    Models::BlockList.from_json(response.body)
  end

  # Get an account's ID info (numeric account ID, RS address, public key) given
  # either a secret passphrase or a public key. Both are optional, but if neither
  # is specified, an exception will be raised.
  #
  # DO NOT SEND PASSPHRASES OVER AN UNENCRYPTED CONNECTION.
  def get_account_id(secret_phrase : String? = nil, public_key : String? = nil)
    if secret_phrase.nil? && public_key.nil?
      raise ArgumentError.new("Must specify either secret_phrase or public_key")
    end

    params = Hash(String, String).new
    params["secretPhrase"] = secret_phrase unless secret_phrase.nil?
    params["publicKey"] = public_key unless public_key.nil?

    response = post(@wallet_uri, "getAccountId", params)
    Models::AccountId.from_json(response.body)
  end

  # Get the lessors to the specified account. A height may optionally be specified.
  def get_account_lessors(account_id : String, height : Int? = nil)
    params = {"account" => account_id}
    params["height"] = height.to_s unless height.nil?

    response = post(@wallet_uri, "getAccountLessors", params)
    Models::AccountLessors.from_json(response.body)
  end

  # Get the public key for the specified account.
  def get_account_public_key(account_id : String)
    response = post(@wallet_uri, "getAccountPublicKey", {"account" => account_id})
    Models::PublicKey.from_json(response.body)
  end

  # Get transaction IDs associated with the specified account. Transactions may
  # optionally be filtered by timestamp, type, subtype, and number of confirmations,
  # and scoped by first and last index.
  def get_account_transaction_ids(account_id : String, timestamp : Int? = nil, transaction_type : Int? = nil, transaction_subtype : Int? = nil, first_index : Int? = nil, last_index : Int? = nil, number_of_confirmations : Int? = nil)
    params = {"account" => account_id}
    params["timestamp"] = timestamp.to_s unless timestamp.nil?
    params["type"] = transaction_type.to_s unless transaction_type.nil?
    params["subtype"] = transaction_subtype.to_s unless transaction_subtype.nil?
    params["firstIndex"] = first_index.to_s unless first_index.nil?
    params["lastIndex"] = last_index.to_s unless last_index.nil?
    params["numberOfConfirmations"] = number_of_confirmations.to_s unless number_of_confirmations.nil?

    response = post(@wallet_uri, "getAccountTransactionIds", params)
    Models::AccountTransactionIds.from_json(response.body)
  end

  # Get the actual transactions associated with the specified account, if any.
  # Transactions may optionally be filtered by timestamp, type, subtype, and number
  # of confirmations, and scoped by first and last index.
  def get_account_transactions(account_id : String, timestamp : Int? = nil, transaction_type : Int? = nil, transaction_subtype : Int? = nil, first_index : Int? = nil, last_index : Int? = nil, number_of_confirmations : Int? = nil)
    params = {"account" => account_id}
    params["timestamp"] = timestamp.to_s unless timestamp.nil?
    params["type"] = transaction_type.to_s unless transaction_type.nil?
    params["subtype"] = transaction_subtype.to_s unless transaction_subtype.nil?
    params["firstIndex"] = first_index.to_s unless first_index.nil?
    params["lastIndex"] = last_index.to_s unless last_index.nil?
    params["numberOfConfirmations"] = number_of_confirmations.to_s unless number_of_confirmations.nil?

    response = post(@wallet_uri, "getAccountTransactions", params)
    Models::TransactionList.from_json(response.body)
  end

  # Get the specified account's balance.
  def get_balance(account_id : String)
    response = post(@wallet_uri, "getBalance", {"account" => account_id})
    Models::Balance.from_json(response.body)
  end

  # Get the specified account's guaranteed balance. The number of confirmations
  # that guarantees confirmation of a transaction may optionally be specified.
  def get_guaranteed_balance(account_id : String, number_of_confirmations : Int? = nil)
    params = {"account" => account_id}
    params["numberOfConfirmations"] = number_of_confirmations.to_s unless number_of_confirmations.nil?

    response = post(@wallet_uri, "getGuaranteedBalance", params)
    Models::GuaranteedBalance.from_json(response.body)
  end

  # Get all unconfirmed transaction IDs associated with the specified account.
  def get_unconfirmed_transaction_ids(account_id : String)
    response = post(@wallet_uri, "getUnconfirmedTransactionIds", {"account" => account_id})
    Models::UnconfirmedTransactionIds.from_json(response.body)
  end

  # Get the actual unconfirmed transactions associated with the specified account.
  def get_unconfirmed_transactions(account_id : String)
    response = post(@wallet_uri, "getUnconfirmedTransactions", {"account" => account_id})
    Models::UnconfirmedTransactions.from_json(response.body)
  end

  # Send money to the specified recipient. All parameters common to creating transactions
  # are accepted. Note that the fee defaults to 1 BURST if not specified.
  def send_money(
    recipient : String,
    amount_nqt : UInt64,
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
    request = Models::SendMoneyRequest.new(
      recipient,
      amount_nqt.to_s,
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
    send_money(request)
  end

  # Send money as specified in the SendMoneyRequest.
  def send_money(request : Models::SendMoneyRequest)
    response = post(@wallet_uri, "sendMoney", request.to_params_hash)
    Models::CreateTransactionResponse.from_json(response.body)
  end

  # Send money to up to 64 recipients, as specified in the given hash of *numeric*
  # account IDs to amounts (in NQT). All parameters common to creating transactions
  # are accepted. Note that the fee defaults to 1 BURST if not specified.
  def send_money_multi(
    recipients : Hash(String, UInt64),
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
    request = Models::SendMoneyMultiRequest.new(
      recipients,
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
    send_money_multi(request)
  end

  # Send money to up to 64 recipients, as specified in the SendMoneyMultiRequest.
  def send_money_multi(request : Models::SendMoneyMultiRequest)
    response = post(@wallet_uri, "sendMoneyMulti", request.to_params_hash)
    Models::CreateTransactionResponse.from_json(response.body)
  end

  # Send the same amount of money (in NQT) to each of up to 128 recipients, as specified in
  # the given array of *numeric* account IDs. All parameters common to creating
  # transactions are accepted. Note that the fee defaults to 1 BURST if not specified.
  def send_money_multi_same(
    recipients : Array(String),
    amount_nqt : UInt64,
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
    request = Models::SendMoneyMultiSameRequest.new(
      recipients,
      amount_nqt.to_s,
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
    send_money_multi_same(request)
  end

  # Send the same amount of money to up to 64 recipients, as specified in the
  # SendMoneyMultiSameRequest.
  def send_money_multi_same(request : Models::SendMoneyMultiSameRequest)
    response = post(@wallet_uri, "sendMoneyMultiSame", request.to_params_hash)
    Models::CreateTransactionResponse.from_json(response.body)
  end

  # Set account info (the name and description of the account). All parameters common
  # to creating transactions are accepted. Note that the fee defaults to 1 BURST if
  # not specified.
  def set_account_info(
    name : String,
    description : String,
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
    request = Models::SetAccountInfoRequest.new(
      name,
      description,
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
    set_account_info(request)
  end

  # Set account info as specified in the SetAccountInfoRequest.
  def set_account_info(request : Models::SetAccountInfoRequest)
    response = post(@wallet_uri, "setAccountInfo", request.to_params_hash)
    Models::CreateTransactionResponse.from_json(response.body)
  end
end
