module BitBns
  module Requests
    class Request
      attr_accessor :verb, :params, :body, :url
      API_BASE_URL  = "https://api.bitbns.com/api/trade/v2"
      PUB_BASE_URL  = "https://bitbns.com"

      def attach_headers?
        @attach_headers
      end

      def response_parser
        Kernel.const_get("BitBns::Responses::#{self.class.to_s.split("::").last}")
      end
    end
  end
end

