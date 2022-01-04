module BitBns
  module Responses
    class FetchTickers < BitBns::Responses::Response
      attr_reader :body, :headers, :raw

      def initialize(response)
        @raw     = response
        @body    = JSON.parse(response.body)
        @headers = response.headers
      end
    end
  end
end
