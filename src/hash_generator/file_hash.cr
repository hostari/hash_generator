require "openssl/hmac"

# SHA256 class returns a string that represents the file's SHA256 hash.
module HashGenerator
  class FileHash
    def initialize
    end

    # Returns the SHA256 hash of a given file (file path).
    def generate_hash(path : String)
      OpenSSL::HMAC.hexdigest(OpenSSL::Algorithm::SHA256, "hostari", File.read(path))
    end
  end
end
