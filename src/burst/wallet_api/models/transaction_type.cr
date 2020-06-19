require "json"

class Burst::WalletApi::Models::TransactionType
  include JSON::Serializable

  property description : String

  property value : Int32

  property subtypes : Array(PeerState)
end
