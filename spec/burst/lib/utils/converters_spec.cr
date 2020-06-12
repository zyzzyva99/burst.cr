require "../../../spec_helper"

describe Burst::Lib::Utils::Converters do
  describe ".string_to_hex_string" do
    it "should convert the string to a hex string of its bytes" do
      result = Burst::Lib::Utils::Converters.string_to_hex_string("testpass")
      result.should eq("7465737470617373")
      Burst::Lib::Utils::Converters.is_hex?(result).should be_true
    end
  end

  describe ".hex_string_to_bytes" do
    it "should decode a hexadecimal string to Bytes" do
      result = Burst::Lib::Utils::Converters.hex_string_to_bytes("7465737470617373")
      String.new(result).should eq("testpass")
      result.should be_a(Bytes)
    end

    it "should return an empty slice if the string is not a hex string" do
      result = Burst::Lib::Utils::Converters.hex_string_to_bytes("zzzz1234567890")
      result.should be_empty
      result.should be_a(Bytes)
    end
  end

  describe ".hex_string_to_byte_array" do
    it "should convert a hex string to an array of UInt8" do
      result = Burst::Lib::Utils::Converters.hex_string_to_byte_array("1234abcd")
      result.should eq([0x12_u8, 0x34_u8, 0xab_u8, 0xcd_u8])
      result.should be_a(Array(UInt8))
    end

    it "should return an empty array if the string is not a hex string" do
      result = Burst::Lib::Utils::Converters.hex_string_to_byte_array("zzzz1234567890")
      result.should be_empty
    end
  end

  describe ".byte_array_to_hex_string" do
    it "should convert an array of UInt8 to a hex string" do
      result = Burst::Lib::Utils::Converters.byte_array_to_hex_string([0xab_u8, 0xcd_u8, 0x12_u8, 0x34_u8])
      result.should eq("abcd1234")
      result.should be_a(String)
    end
  end

  describe ".is_hex?" do
    it "should return true if all characters in the string are hex characters" do
      Burst::Lib::Utils::Converters.is_hex?("123abc").should be_true
    end

    it "should return false if the string contains non-hex characters" do
      Burst::Lib::Utils::Converters.is_hex?("123xyz").should be_false
    end

    it "should be case insensitive" do
      Burst::Lib::Utils::Converters.is_hex?("123aBc").should be_true
    end
  end
end
