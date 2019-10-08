# frozen_string_literal: true

class Product
  class Error < StandardError; end

  attr_reader :name, :code, :price

  def initialize(args)
    validate_fields(args)

    @name = args['name']
    @code = args['code']
    @price = args['price']
  end

  def self.load_allowed_products
    parsed_products = JSON.parse(File.read('./config/products.json'))

    products = []
    parsed_products.each do |parsed_product|
      fineded = products.select { |p| p.code == parsed_product['code'] }
      if fineded.any?
        raise Error, "Duplicate product record Producs: #{finded}, parsed: #{parsed_product}"
      end

      products << Product.new(parsed_product)
    end
    raise Error, 'No products in config/products.json' if products.empty?

    products
  end

  private

  def validate_fields(args)
    return true if %w[code name price].all? { |s| args.key? s }

    raise Error, "Not valid data for product, data: #{args}"
  end
end
