# frozen_string_literal: true

require 'json'
require 'I18n'
require 'pry'
require 'product'

Dir['./lib/rules/*.rb'].each { |file| require file }
I18n.load_path << Dir[File.expand_path('config/locales') + '/*.yml']

# Checkout class for calculating totals with promotion rules
# main file for current gem
class Checkout
  class Error < StandardError; end

  attr_accessor :products
  attr_reader :items

  def initialize(pricing_rules = default_rules)
    @items = []
    @adjustments = []
    @pricing_rules = pricing_rules
    @products = Product.load_allowed_products
  end

  # Add product to items and return product
  def scan(code)
    scanned = @products.find { |p| p.code == code }
    raise Error, I18n.t('errors.product_not_found', code: code) unless scanned

    @items << scanned
    calculate_adjustments
    scanned
  end

  # Return total amount with adjustments
  def total
    all_amount = @items.map(&:price).sum
    all_adjustments = @adjustments.sum { |a| a[:amount] }

    all_amount + all_adjustments
  end

  private

  def calculate_adjustments
    @adjustments = []
    @pricing_rules.each do |rule|
      @adjustments << { kind: rule.class.name,
                        amount: rule.new(@items).adjustment }
    end
  end

  def default_rules
    [Rules::BulkTshirt, Rules::BuyTwoGetOne]
  end
end
