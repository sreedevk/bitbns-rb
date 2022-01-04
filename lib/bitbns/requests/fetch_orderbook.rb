# frozen_string_literal: true

module BitBns
  module Requests
    class FetchMarkets < BitBns::Requests::Request
      def initialize(opts)
        @url             = "#{PUB_BASE_URL}/order/fetchOrderbook/"
        @params          = { symbol: opts.fetch(:symbol, "BTCUSDT") }
        @headers         = {}
        @verb            = :get
      end
    end
  end
end
