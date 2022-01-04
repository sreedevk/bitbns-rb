require_relative "../lib/bitbns.rb"

api_client = BitBns::Client.new({
  api_key: ENV["BITBNS_PUBLIC_KEY"],
  api_secret_key: ENV["BITBNS_SECRET_KEY"]
})

response = api_client.send_request("fetch_markets")

binding.pry

__END__
