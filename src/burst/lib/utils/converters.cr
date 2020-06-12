module Burst::Lib::Utils::Converters
  # Converts a text string to a string containing the 8-bit hexadecimal
  # representation of the UTF-8 value of each character, in order.
  def self.string_to_hex_string(str : String)
    str.encode("UTF-8").hexstring
  end

  # Converts a string of hexadecimal numbers to a Bytes slice, retaining
  # ordering.
  def self.hex_string_to_bytes(str : String)
    is_hex?(str) ? str.hexbytes : Bytes.empty
  end

  # Converts a string of hexadecimal numbers to an array of UInt8, retaining
  # ordering.
  def self.hex_string_to_byte_array(str : String)
    is_hex?(str) ? str.hexbytes.to_a : Array(UInt8).new
  end

  # Converts an array of UInt8 to a string of corresponding hexadecimal numbers,
  # retaining order.
  def self.byte_array_to_hex_string(arr : Array(UInt8))
    arr.map(&.to_s(16)).join
  end

  # Returns true if the string represents a series of hexadecimal bytes, or
  # false if not.
  def self.is_hex?(str : String)
    !str.hexbytes?.nil?
  end
end
