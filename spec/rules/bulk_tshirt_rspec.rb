# frozen_string_literal: true

RSpec.describe Rules::BulkTshirt do
  let(:voucher) { Product.new(name: 'V', code: 'VOUCHER', price: 5) }
  let(:tshirt) { Product.new(name: 'T', code: 'TSHIRT', price: 20) }
  let(:mug) { Product.new(name: 'M', code: 'MUG', price: 7.50) }

  it '#eligible? false' do
    items = [voucher, tshirt, mug]
    rule = Rules::BulkTshirt.new(items)
    expect(rule.eligible?).to eq(false)
  end

  it '#calculation' do
    items = [tshirt, tshirt, tshirt, voucher]
    rule = Rules::BulkTshirt.new(items)
    adjustment = (19 * 3 + voucher.price) - (tshirt.price * 3 + voucher.price)
    expect(rule.adjustment).to eq(adjustment)
  end
end
