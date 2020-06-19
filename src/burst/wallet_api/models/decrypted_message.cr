require "json"

class Burst::WalletApi::Models::DecryptedMessage
  include JSON::Serializable

  @[JSON::Field(key: "decryptedMessage")]
  property decrypted_message : String

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32
end
