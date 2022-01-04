# frozen_string_literal: true

module BitBns
  module Requests
    class FetchTickers < BitBns::Requests::Request
      def initialize(opts)
        @url             = "#{PUB_BASE_URL}/order/fetchTickers/"
        @params          = {}
        @headers         = {}
        @verb            = :get
      end
    end
  end
end
