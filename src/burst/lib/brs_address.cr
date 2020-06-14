# A class representing a BURST address. It is initialized with a numeric
# account ID and can return a textual "BURST-" address.
# TODO: Initialize with textual address and return numeric account ID.
#
# This code was ported from beatsbears's [pyburstlib](https://github.com/beatsbears/pyburstlib)
# and CurbShifter's [BurstLib](https://github.com/CurbShifter/BurstLib)
class Burst::Lib::BrsAddress
  GEXP     = [1, 2, 4, 8, 16, 5, 10, 20, 13, 26, 17, 7, 14, 28, 29, 31, 27, 19, 3, 6, 12, 24, 21, 15, 30, 25, 23, 11, 22, 9, 18, 1]
  GLOG     = [0, 0, 1, 18, 2, 5, 19, 11, 3, 29, 6, 27, 20, 8, 12, 23, 4, 10, 30, 17, 7, 22, 28, 26, 21, 25, 9, 16, 13, 14, 24, 15]
  CWMAP    = [3, 2, 1, 0, 7, 6, 5, 4, 13, 14, 15, 16, 12, 8, 9, 10, 11]
  ALPHABET = "23456789ABCDEFGHJKLMNPQRSTUVWXYZ"

  def initialize
    @codeword = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  end

  # Returns the address in BURST-xxxx-xxxx-xxxx-xxxxx format.
  def to_s
    result = "BURST-"
    (0...@codeword.size).each do |i|
      result += ALPHABET[@codeword[CWMAP[i]]]
      result += "-" if (i & 3 == 3) && (i < 13)
    end
    result
  end

  # Seeds the account ID for this BrsAddress. Does not support textual "BURST-"
  # addresses for now.
  def set_address(account_id : String)
    raise Burst::BadAddressException.new("Invalid account ID") unless account_id.size >= 19 && account_id.match(/^\d+$/)

    reset
    from_acct(account_id)
  end

  def set_address(account_id : Int)
    set_address(account_id.to_s)
  end

  # Initializes the codeword used to build a textual BURST address from the
  # given account ID.
  def from_acct(account_id : String)
    length = account_id.size
    input = [0] * length
    output = [] of Int32
    pos = 0

    raise Burst::BadAddressException.new("Incorrectly formatted account ID") if length == 20 && account_id[0] != '1'

    (0...length).each do |i|
      input[i] = account_id[i].to_i
    end

    loop do
      divide = 0
      newlen = 0

      (0...length).each do |i|
        divide = divide * 10 + input[i]

        if divide >= 32
          input[newlen] = divide >> 5
          newlen += 1
          divide = divide & 31
        elsif newlen > 0
          input[newlen] = 0
          newlen += 1
        end
      end

      length = newlen
      if output.size > pos
        output[pos] = divide
      else
        pos += 1
        output.push(divide)
      end

      break if length <= 0
    end

    (0...13).each do |i|
      if pos >= 0
        @codeword[i] = output[i]
      else
        @codeword[i] = 0
      end
      pos -= 1
    end

    encode
  end

  # Resets the object to a default state.
  def reset
    (0..16).each { |i| @codeword[i] = 1 }
  end

  private def encode
    p = [0, 0, 0, 0]
    (0..12).reverse_each do |i|
      fb = @codeword[i] ^ p[3]
      p[3] = p[2] ^ gmult(30, fb)
      p[2] = p[1] ^ gmult(6, fb)
      p[1] = p[0] ^ gmult(9, fb)
      p[0] = gmult(17, fb)
    end
    @codeword[13] = p[0]
    @codeword[14] = p[1]
    @codeword[15] = p[2]
    @codeword[16] = p[3]
  end

  private def gmult(a, b)
    return 0 if a == 0 || b == 0

    idx = (GLOG[a] + GLOG[b]) % 31
    return GEXP[idx]
  end
end
