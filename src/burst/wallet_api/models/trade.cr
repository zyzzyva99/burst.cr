require "json"

class Burst::WalletApi::Models::Trade
  include JSON::Serializable

  property seller : String

  @[JSON::Field(key: "quantityQNT")]
  property quantity_qnt : String

  @[JSON::Field(key: "bidOrder")]
  property bid_order : String

  @[JSON::Field(key: "sellerRS")]
  property seller_rs : String

  property buyer : String

  @[JSON::Field(key: "priceNQT")]
  property price_nqt : String

  @[JSON::Field(key: "askOrder")]
  property ask_order : String

  @[JSON::Field(key: "buyerRS")]
  property buyer_rs : String

  property decimals : Int32?

  property name : String?

  property block : String

  property asset : String

  @[JSON::Field(key: "askOrderHeight")]
  property ask_order_height : Int32

  @[JSON::Field(key: "tradeType")]
  property trade_type : String

  property timestamp : Int32

  property height : Int32

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32?
end
