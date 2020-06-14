require "../../spec_helper"

password = "testpass"
public_key = "5e7c74732edd765a948d6a070f2dc61dc140f5b3c8c6b36ca44e54e83a5b1954"
account_id = 17836903925142865226

describe Burst::Lib::Crypto do
  describe ".get_public_key" do
    it "should generate the correct public key from a password" do
      Burst::Lib::Crypto.get_public_key(password).should eq(public_key)
    end
  end

  describe ".get_account_id" do
    it "should generate the correct account ID from a password" do
      result = Burst::Lib::Crypto.get_account_id(password)
      result.should eq(account_id)
      result.should be_a(UInt64)
    end
  end
end
