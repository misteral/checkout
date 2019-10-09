## Installation

```
$ git clone git@github.com:misteral/checkout.git
$ bundle install
```

## Usage
```
require 'checkout'

co = Checkout.new([Rules::BulkTshirt, Rules::BuyTwoGetOne])
co.scan("VOUCHER")
co.scan("VOUCHER")
co.scan("TSHIRT")
price = co.total
```

## Command Line Interface

```
$ bundle exec rake console
```

## Test
```
$ bundle exec rspec .
```

## Classes Descriptions

### Checkout
Checkout class for calculating totals with promotion rules.
Default load allowable products from './config/products.json'.

params:
  * Array of Rules
instance methods:
  * scan(code) - add product to items and return product;
  * total - return total amount with adjustments;
  * default_rules - return default rules;
  * product - returns allowable products;
  * products= - replace current allowable products;
  * items - current items(products) in Checkout.

### Rules::Base
Base class for checkout rules.

params:
  * Array of Product as items in Checkout
instance methods:
  * eligible? - returns true if calculation can be implemented for this items;
  * calculation - returns amount of discount for items;
  * adjustment - return calculation if eligible.

### Rules::BulkTshirt < Rules::Base
'Buy 3 or more TSHIRT items, the price per unit should be 19.00' rule.

### Rules::BuyTwoGetOne < Rules::Base
'Buy two of the same product, get one free' rule.

### Product
Main product class.

params:
  * hash of data, example: `Product.new('name' => 'name', 'code' => 'code', 'price' => 34)`

methods:
  * load_products(file) - load products from json file


