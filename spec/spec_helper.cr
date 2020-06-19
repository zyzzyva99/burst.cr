require "spec"
require "dotenv"
require "vcr"
require "../src/burst"

Dotenv.load(".env-test")

#Spec.before_suite { load_cassette("Burst::Client", :record) }

TEST_WALLET_URL    = ENV["TESTNET_WALLET_URL"]
TEST_ACCOUNT_PASSPHRASE = ENV["TEST_ACCOUNT_PASSPHRASE"]
TEST_ACCOUNT_ID    = ENV["TEST_NUMERIC_ACCOUNT_ID"]
TEST_RS_ACCOUNT_ID = ENV["TEST_RS_ACCOUNT_ID"]
TEST_ACCOUNT_PUBLIC_KEY = ENV["TEST_ACCOUNT_PUBLIC_KEY"]
TEST_CLIENT        = Burst::Client.new(TEST_WALLET_URL)

def client
  TEST_CLIENT
end
