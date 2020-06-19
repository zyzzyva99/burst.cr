require "json"

class Burst::WalletApi::Models::Note
  include JSON::Serializable

  property data : String

  property nonce : String
end
