# BitBns Ruby Client

Ruby Wrapper Around [BitBns APIs](https://documenter.getpostman.com/view/2372406/Szt5hBp7?version=latest).

## Installation

- Add through Gemfile

```ruby
gem "bitbns"
```

- Install through gem cli

```bash
gem install bitbns
```

## Usage

```ruby
api_client = BitBns::Client.new({
  api_key: ENV["BITBNS_PUBLIC_KEY"],
  api_secret_key: ENV["BITBNS_SECRET_KEY"]
})

# Fetch Markets
response = api_client.send_request("fetch_markets")

# Fetch Tickers
response = api_client.send_request("fetch_tickers")

# Fetch OrderBook
response = api_client.send_request("fetch_orderbook", { symbol: "BTCUSDT" })

```

## Roadmap

1. Add Authentication Header Logic
2. Implement Private APIs

## Contributions
Feel free to fork this repo & raise a request against the `main` branch if you wish to contribute.
Some guidelines to contributing are.

1. Add Plenty of Tests around the feature you add (We Use Minitest)
2. Run Rubocop before you raise a PR.
