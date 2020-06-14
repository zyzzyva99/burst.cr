require "../../spec_helper"

account_id1 = 17836903925142865226
address1 = "BURST-LKCC-MQRG-7NH6-HBD4H"
account_id2 = 8435526664171750194
address2 = "BURST-Q2TL-TV5N-D5QK-94A6C"
bad_account_id = "27836903925142865226"

describe Burst::Lib::BrsAddress do
  describe "#to_s" do
    context "when no account id is specified" do
      it "should return a default" do
        addr = Burst::Lib::BrsAddress.new
        addr.to_s.should eq("BURST-2223-2222-2222-22222")
      end
    end

    context "when an account id has been set" do
      it "should correctly map the account ID to a textual BURST address" do
        addr = Burst::Lib::BrsAddress.new
        addr.set_address(account_id1)
        addr.to_s.should eq(address1)
        addr.set_address(account_id2)
        addr.to_s.should eq(address2)
      end

      it "should raise an exception when an incorrectly formatted account ID is encountered" do
        addr = Burst::Lib::BrsAddress.new
        expect_raises(Burst::BadAddressException) { addr.set_address(bad_account_id) }
      end
    end
  end
end
