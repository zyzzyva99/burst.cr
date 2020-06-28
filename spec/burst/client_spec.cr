require "../spec_helper"

describe Burst::Client do
  it "should initialize" do
    client = Burst::Client.new(TEST_WALLET_URL)
  end
end
