require "json"

class Burst::WalletApi::Models::BaseTransactionRequest
  @[JSON::Field(key: "secretPhrase")]
  property! secret_phrase : String

  @[JSON::Field(key: "publicKey")]
  property public_key : String?

  @[JSON::Field(key: "feeNQT")]
  property fee_nqt : String?

  property deadline : String?

  @[JSON::Field(key: "referencedTransactionFullHash")]
  property referenced_transaction_full_hash : String?

  property broadcast : String?

  property message : String?

  @[JSON::Field(key: "messageIsText")]
  property message_is_text : String?

  @[JSON::Field(key: "messageToEncrypt")]
  property message_to_encrypt : String?

  @[JSON::Field(key: "messageToEncryptIsText")]
  property message_to_encrypt_is_text : String?

  @[JSON::Field(key: "encryptedMessageData")]
  property encrypted_message_data : String?

  @[JSON::Field(key: "encryptedMessageNonce")]
  property encrypted_message_nonce : String?

  @[JSON::Field(key: "messageToEncryptToSelf")]
  property message_to_encrypt_to_self : String?

  @[JSON::Field(key: "messageToEncryptToSelfIsText")]
  property message_to_encrypt_to_self_is_text : String?

  @[JSON::Field(key: "encryptToSelfMessageData")]
  property encrypt_to_self_message_data : String?

  @[JSON::Field(key: "encryptToSelfMessageNonce")]
  property encrypt_to_self_message_nonce : String?

  @[JSON::Field(key: "recipientPublicKey")]
  property recipient_public_key : String?

  def initialize(
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
    # TODO: Is there a better way to do this?
    params = Hash(String, String).new
    params["secretPhrase"] = @secret_phrase.not_nil!
    params["publicKey"] = @public_key.not_nil! unless @public_key.nil?
    params["feeNQT"] = @fee_nqt.not_nil! unless @fee_nqt.nil?
    params["deadline"] = @deadline.not_nil! unless @deadline.nil?
    params["referencedTransactionFullHash"] = @referenced_transaction_full_hash.not_nil! unless @referenced_transaction_full_hash.nil?
    params["broadcast"] = @broadcast.not_nil! unless @broadcast.nil?
    params["message"] = @message.not_nil! unless @message.nil?
    params["messageIsText"] = @message_is_text.not_nil! unless @message_is_text.nil?
    params["messageToEncrypt"] = @message_to_encrypt.not_nil! unless @message_to_encrypt.nil?
    params["messageToEncryptIsText"] = @message_to_encrypt_is_text.not_nil! unless @message_to_encrypt_is_text.nil?
    params["encryptedMessageData"] = @encrypted_message_data.not_nil! unless @encrypted_message_data.nil?
    params["encryptedMessageNonce"] = @encrypted_message_nonce.not_nil! unless @encrypted_message_nonce.nil?
    params["messageToEncryptToSelf"] = @message_to_encrypt_to_self.not_nil! unless @message_to_encrypt_to_self.nil?
    params["messageToEncryptToSelfIsText"] = @message_to_encrypt_to_self_is_text.not_nil! unless @message_to_encrypt_to_self_is_text.nil?
    params["encryptToSelfMessageData"] = @encrypt_to_self_message_data.not_nil! unless @encrypt_to_self_message_data.nil?
    params["encryptToSelfMessageNonce"] = @encrypt_to_self_message_nonce.not_nil! unless @encrypt_to_self_message_nonce.nil?
    params["recipientPublicKey"] = @recipient_public_key.not_nil! unless @recipient_public_key.nil?
    params["requestType"] = "sendMoney"
    params
  end
end
