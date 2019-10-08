# frozen_string_literal: true

RSpec.describe Product do
  it 'new' do
    product = Product.new('name' => 'name', 'code' => 'code', 'price' => 34)
    expect(product).to be_kind_of(Product)
  end

  it 'raise exceprion if not valid' do
    expect { Product.new('name' => 'name') }
      .to raise_error(Product::Error)
  end
end
