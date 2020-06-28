require "json"

class Burst::WalletApi::Models::SendMoneyMultiSameRequest < Burst::WalletApi::Models::BaseTransactionRequest
  include JSON::Serializable

  property recipients : Array(String)

  @[JSON::Field(key: "amountNQT")]
  property amount_nqt : String

  def initialize(
    @recipients,
    @amount_nqt,
    @secret_phrase,
    @public_key = nil,
    @fee_nqt = nil,
    @deadline = nil,
    @referenced_transaction_full_hash = nil,
    @broadcast = nil,
    @message = nil,
    @message_is_text = nil,
    @message_to_encrypt = nil,
    @message_to_encrypt_is_text = nil,
    @encrypted_message_data = nil,
    @encrypted_message_nonce = nil,
    @message_to_encrypt_to_self = nil,
    @message_to_encrypt_to_self_is_text = nil,
    @encrypt_to_self_message_data = nil,
    @encrypt_to_self_message_nonce = nil,
    @recipient_public_key = nil
  )
  end

  def to_params_hash
    params = super
    params["recipients"] = @recipients.join(";")
    params["amountNQT"] = @amount_nqt
    params
  end
end
