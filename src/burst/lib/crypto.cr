require "openssl"
require "sodium"

module Burst::Lib::Crypto
  # Returns a hex string representing the public key associated with a secret
  # key. Accepts either a text password or a hex string as the secret key.
  def self.get_public_key(secret_key)
    secret_key_hex = secret_key_to_hex_string(secret_key)
    secret_key_bytes = Utils::Converters.hex_string_to_bytes(secret_key_hex)
    secret_key_hash = sha256_hash(secret_key_bytes)
    public_key = Sodium::CryptoBox::SecretKey.new(secret_key_hash).public_key
    public_key.to_slice.hexstring
  end

  # Returns the BURST account ID associated with a secret key as a UInt64.
  # Accepts either a text password or a hex string as the secret key.
  def self.get_account_id(secret_key)
    secret_key_hex = secret_key_to_hex_string(secret_key)
    public_key = get_public_key(secret_key_hex)
    public_key_bytes = Utils::Converters.hex_string_to_bytes(public_key)
    public_key_hash = sha256_hash(public_key_bytes)
    IO::ByteFormat::LittleEndian.decode(UInt64, public_key_hash)
  end

  private def self.secret_key_to_hex_string(secret_key)
    if Utils::Converters.is_hex?(secret_key)
      secret_key
    else
      Utils::Converters.string_to_hex_string(secret_key)
    end
  end

  private def self.sha256_hash(message : Bytes)
    sha256 = OpenSSL::Digest.new("SHA256")
    sha256.update(message)
    sha256.final
  end
end
