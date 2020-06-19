require "json"

class Burst::WalletApi::Models::AccountAsset
  include JSON::Serializable

  @[JSON::Field(key: "quantityQNT")]
  property quantity_qnt : String

  @[JSON::Field(key: "accountRS")]
  property account_rs : String

  @[JSON::Field(key: "unconfirmedQuantityQNT")]
  property unconfirmed_quantity_qnt : String

  property asset : String

  property account : String
end
