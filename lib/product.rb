# frozen_string_literal: true

class Product
  class Error < StandardError; end

  attr_reader :name, :code, :price

  def initialize(args)
    @name = args['name'] || args[:name]
    @code = args['code'] || args[:code]
    @price = args['price'] || args[:price]

    validate_fields(args)

    @price = @price.to_f
  end

  # Load products from file and returns as array of Products
  def self.load_allowed_products(file_name = './config/products.json')
    parsed_products = JSON.parse(File.read(file_name))

    products = []
    parsed_products.each do |parsed_product|
      fineded = products.select { |p| p.code == parsed_product['code'] }
      if fineded.any?
        raise Error, I18n.t('errors.product_duplication',
                            finded: fineded, parsed_product: parsed_product)
      end

      products << Product.new(parsed_product)
    end
    raise Error, I18n.t('errors.products_not_found') if products.empty?

    products
  end

  private

  # returns true if can covert into Float, just helper method
  def number?(string)
    return true if Float(string)
  rescue StandardError
    false
  end

  # return true if args contain required attributes, and price can be Float
  def validate_fields(args)
    raise Error, I18n.t('errors.price_not_float') unless number?(@price)

    return true if %w[code name price].all? { |s| args.key? s }
    return true if %i[code name price].all? { |s| args.key? s }

    raise Error, I18n.t('errors.product_invalid', args: args)
  end
end
