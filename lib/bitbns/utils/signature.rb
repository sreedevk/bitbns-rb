require 'openssl'

module BitBns::Utils
  class Signature
    def initialize(payload, secret)
      @generated_signature = OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha512'), secret, payload)
    end

    def generate!
      @generated_signature
    end
  end
end
