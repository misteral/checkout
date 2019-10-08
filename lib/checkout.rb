# frozen_string_literal: true

require 'json'
require 'I18n'
require 'pry'
require 'product'

Dir['./lib/rules/*.rb'].each { |file| require file }
I18n.load_path << Dir[File.expand_path('config/locales') + '/*.yml']

# Runs a subprocess and applies handlers for stdout and stderr
# Params:
# +pricing_rules+:: array of price rules classes Rules
class Checkout
  class Error < StandardError; end

  attr_reader :products, :items

  def initialize(pricing_rules = nil)
    @items = []
    @pricing_rules = pricing_rules || default_rules
    @products = Product.load_allowed_products
  end

  def scan(code)
    scanned = @products.select { |p| p.code == code }
    raise Error, "Can't find product with code:#{code}" unless scanned.any?
  end

  def total
  end

  private

  def default_rules
    []
  end
end
