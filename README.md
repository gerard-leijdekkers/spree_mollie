SpreeMollie
===========

Except payments using the [Mollie](https://www.mollie.com) payment provider in Spree

**NOTE This is currently only implemented agains Spree master (3.0.0.beta)**

[![wercker status](https://app.wercker.com/status/52c82d6a6ba0e8d59a4bde329939e420/m "wercker status")](https://app.wercker.com/project/bykey/52c82d6a6ba0e8d59a4bde329939e420)

[![Code Climate](https://codeclimate.com/github/pero-ict-solutions/spree_mollie/badges/gpa.svg)](https://codeclimate.com/github/pero-ict-solutions/spree_mollie)

[![Test Coverage](https://codeclimate.com/github/pero-ict-solutions/spree_mollie/badges/coverage.svg)](https://codeclimate.com/github/pero-ict-solutions/spree_mollie)


Installation
------------

Add spree_mollie to your Gemfile:

```ruby
gem 'spree_mollie'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_mollie:install
```

Activate SpreeMollie by selecting Spree::PaymentMethod::Mollie as a new payment method in the backend. Set the 'payment methods' setting to a comma separated string with the mollie payment methods you want to present in the frontend. Default value "ideal, creditcard, mistercash, sofort, banktransfer, paypal, bitcoin, podiumcadeaukaart, paysafecard, kbc, belfius"

Testing
-------

First bundle your dependencies, then run `rake`. `rake` will default to building the dummy app if it does not exist, then it will run specs. The dummy app can be regenerated by using `rake test_app`.

```shell
bundle
bundle exec rake
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_mollie/factories'
```

Copyright (c) 2015 PeRo ICT Solutions, released under the New BSD License
