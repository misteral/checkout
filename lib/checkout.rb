# frozen_string_literal: true

Dir['./rules/*.rb'].each { |file| require file }

# Runs a subprocess and applies handlers for stdout and stderr
# Params:
# +pricing_rules+:: list of price rules
class Checkout
  def initialize(pricing_rules = nil)
    @product_list = []
    @pricing_rules = pricing_rules || default_rules
  end

  def scan(name)
  end

  def total
  end
end
