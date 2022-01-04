# frozen_string_literal: true

require "minitest/autorun"
require_relative "../lib/bitbns.rb"

describe BitBns::Client do
  before do
    @client = BitBns::Client.new(
      api_key: ENV["BITBNS_PUBLIC_KEY"],
      api_secret_key: ENV["BITBNS_SECRET_KEY"]
    )
  end

  describe "#send_request" do
    it "fetches bitbns ticker when called with `fetch_markets` option" do
      response = @client.send_request("fetch_markets")

      assert_equal response.raw.status, 200
      assert_equal response.body.key?("bids"), true
      assert_equal response.body.key?("asks"), true
      assert_equal response.body.key?("timestamp"), true
      assert_equal response.body.key?("datetime"), true
      assert_equal response.body.key?("nonce"), true
    end

    it "fetches bitbns markets when called with `fetch_tickers` option" do
      response = @client.send_request("fetch_tickers")
      assert_equal response.raw.status, 200
    end

    it "fetches bitbns orderbook when called with `orderbook` option" do
      response = @client.send_request("fetch_orderbook", { symbol: "BTCUSDT" })
      assert_equal response.raw.status, 200
    end
  end
end
