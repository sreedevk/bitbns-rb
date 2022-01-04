# BitBns Ruby Client

Ruby Wrapper Around [BitBns APIs](https://documenter.getpostman.com/view/2372406/Szt5hBp7?version=latest).

## Usage

```ruby
api_client = BitBns::Client.new({
  api_key: ENV["BITBNS_PUBLIC_KEY"],
  api_secret_key: ENV["BITBNS_SECRET_KEY"]
})

# Fetch Markets
response = api_client.send_request("fetch_markets")
```
