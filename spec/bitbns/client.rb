# frozen_string_literal: true

require "minitest/autorun"
require_relative "../../lib/bitbns.rb"

describe BitBns::Client do
  before do
    @client = BitBns::Client.new(
      api_key: ENV["BITBNS_PUBLIC_KEY"],
      api_secret_key: ENV["BITBNS_SECRET_KEY"]
    )
  end

  describe "#send_request" do
    it "fetches bitbns ticker when called with `fetch_tickers` option" do
    end
  end
end
