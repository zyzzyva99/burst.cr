require "json"

class Burst::WalletApi::Models::PeerState
  include JSON::Serializable

  property description : String

  property value : Int32
end
