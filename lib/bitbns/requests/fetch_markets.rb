# frozen_string_literal: true
module BitBns
  module Requests
    class FetchMarkets < BitBns::Requests::Request
      def initialize(opts)
        @url             = "#{PUB_BASE_URL}/order/fetchMarkets/"
        @params          = {}
        @headers         = {}
        @verb            = :get
      end
    end
  end
end
