require 'base64'

module BitBns::Utils
  class Payload
    def initialize(request)
      @request = request
    end

    def generate!
      Base64.encode64({timeStamp_nonce: generate_timestamp, body: @request.body.to_json}.to_json)
    end

    private

    def generate_timestamp
      String(Integer(Time.now.to_f.round(3) * 1000))
    end
  end
end
