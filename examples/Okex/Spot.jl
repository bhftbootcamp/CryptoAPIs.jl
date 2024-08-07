# Okex/Spot
# https://www.okx.com/docs-v5/en/

using Dates
using CryptoExchangeAPIs
using CryptoExchangeAPIs.Okex

Okex.Spot.candle(;
    instId = "BTC-USDT",
    bar = Okex.Spot.Candle.d1,
)

okex_client = OkexClient(;
    base_url = "https://www.okx.com",
    public_key = ENV["OKEX_PUBLIC_KEY"],
    secret_key = ENV["OKEX_SECRET_KEY"],
    passphrase = ENV["OKEX_PASSPHRASE"],
)

Okex.Spot.currency(okex_client; ccy = "BTC")
