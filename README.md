# burst.cr

A Crystal implementation of the Burst API and related utilities. Heavily influenced by [BurstLib](https://github.com/CurbShifter/BurstLib) and [pyburstlib](https://github.com/beatsbears/pyburstlib).

Requires Crystal 0.35.0 or higher.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     burst:
       github: zyzzyva99/burst
   ```

2. Run `shards install`

## Usage

```crystal
require "burst"

# Configuration
wallet_url = "https://burst.wallet.com:7777"
my_secret_phrase = "blah blah blah"
my_account_id = "BURST-xxxx-xxxx-xxxx-xxxxx"
another_account_id = "BURST-yyyy-yyyy-yyyy-yyyyy"

# Initialize the client
client = Burst::Client.new(wallet_url)

# Get my balance
balance_info = client.get_balance(my_account_id)
balance_in_coins = balance_info.balance_nqt.to_i64 / 100000000

# Send some money
two_burstcoins_in_nqt = 2 * 100000000
fee_in_nqt = 10000000
client.send_money(recipient: another_account_id, amount_nqt: two_burstcoins_in_nqt, secret_phrase: my_secret_phrase, fee_nqt: fee_in_nqt)
```

There are many API calls and utilities, with more being added as development continues. Docs are coming soon, but for now, check out the specs for usage examples.

## Development

Just add some methods and write some specs.

The current specs are designed to be run against a live (**TESTNET!**) wallet. You'll need to copy `.env-test-example` to `.env-test` and fill in some configuration info. See `.env-test-example` for more info.

## Contributing

1. Fork it (<https://github.com/zyzzyva99/burst/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [zyzzyva](https://github.com/zyzzyva99) - creator and maintainer

## Donations

- BURST: BURST-ZYZZ-5MDK-8A4D-3JY5Y
