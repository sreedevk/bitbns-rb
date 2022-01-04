# frozen_string_literal: true

module BitBns
  module Requests
    class ListOpenLimitOrders < BitBns::Requests::Request
      def initialize(opts)
        @url                = "#{API_BASE_URL}/getordersnew"
        @params             = {}
        @body               = { symbol: opts.fetch(:symbol, "BTC_USDT"), side: request_side(opts), page: opts.fetch(:page, 0) }
        @attach_headers     = true
        @verb               = :post
      end

      private 

      def request_side(opts)
        opts[:usdt] ? "usdtListOpenBracketOrders" : "listOpenBracketOrders"
      end
    end
  end
end
