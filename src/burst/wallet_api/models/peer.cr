require "json"

class Burst::WalletApi::Models::Peer
  include JSON::Serializable

  @[JSON::Field(key: "lastUpdated")]
  property last_updated : Int32

  @[JSON::Field(key: "downloadedVolume")]
  property downloaded_volume : Int32

  property blacklisted : Bool

  @[JSON::Field(key: "announcedAddress")]
  property announced_address : String

  property application : String

  @[JSON::Field(key: "uploadedVolume")]
  property uploaded_volume : Int32

  property state : Int32

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32

  property version : String

  property platform : String

  @[JSON::Field(key: "shareAddress")]
  property share_address : Bool
end
