# frozen_string_literal: true

require_relative "./requests/base.rb"
require_relative "./responses/base.rb"
require_relative "./utils/signature.rb"
require_relative "./utils/payload.rb"

module BitBns
  class Client
    attr_reader :api_key, :api_secret_key, :version
    REQ_NAMESPACE = "BitBns::Requests"

    def initialize(config)
      @api_key        = config.fetch(:api_key)
      @api_secret_key = config.fetch(:api_secret_key)
      @version        = config.fetch(:version, 2)
    end

    def send_request(name, options = {})
      request_spec          = Kernel.const_get(parse_request_name(name)).new(options)
      request_txn_modifiers = [
        request_spec.verb,
        request_spec.url,
        request_spec.params,
      ]

      response = Faraday.new.send(*request_txn_modifiers) do |req|
        req.headers = generate_headers(request_spec) if request_spec.attach_headers?
        req.body    = request_spec.body
      end

      request_spec.response_parser.new(response)
    end

    private
    
    def generate_headers(request)
      payload = BitBns::Utils::Payload.new(request).generate!
      signature = BitBns::Utils::Signature.new(payload, @api_secret_key).generate!
      {
        "X-BITBNS-APIKEY"  => @api_key,
        "X-BITBNS-PAYLOAD" => payload,
        "X-BITBNS-SIGNATURE" => signature
      }
    end

    def parse_request_name(name)
      "#{REQ_NAMESPACE}::#{name.split("_").map(&:capitalize).join}"
    end
  end
end
