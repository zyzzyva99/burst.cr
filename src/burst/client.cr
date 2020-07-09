require "http/client"
require "./wallet_api/*"

class Burst::Client
  include WalletApi::Accounts
  include WalletApi::ServerInformation
  include WalletApi::Block

  DEFAULT_WALLET_PORT     = 8125
  DEFAULT_WALLET_ENDPOINT = "/burst"

  @wallet_uri : URI

  def initialize(wallet_url : String, wallet_endpoint : String? = nil)
    @wallet_uri = build_uri(wallet_url, DEFAULT_WALLET_PORT, wallet_endpoint || DEFAULT_WALLET_ENDPOINT)
  end

  private def build_uri(url : String, default_port : Int, default_endpoint : String)
    uri = URI.parse(url)
    uri.port = DEFAULT_WALLET_PORT if uri.port.nil?
    uri.path = DEFAULT_WALLET_ENDPOINT if uri.path.nil? || uri.path.empty?
    uri
  end

  private def post(api_uri : URI, request_type : String, params : Hash(String, String) = {} of String => String)
    encoded_params = HTTP::Params.encode(params.merge({"requestType" => request_type}))
    response = HTTP::Client.post(api_uri, form: encoded_params)
    validate_response(response)
    response
  end

  private def validate_response(response)
    if !response.success?
      raise Burst::HttpException.new("#{response.status_code} - #{response.status_message || "(No message)"}")
    elsif !JSON.parse(response.body).dig?("errorCode").nil?
      raise Burst::ApiException.new(api_error: Burst::Models::ApiError.from_json(response.body))
    end
  end
end
