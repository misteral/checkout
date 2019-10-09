# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Rules::BuyTwoGetOne do
  let(:voucher) { Product.new(name: 'V', code: 'VOUCHER', price: 5) }
  let(:tshirt) { Product.new(name: 'T', code: 'TSHIRT', price: 20) }
  let(:mug) { Product.new(name: 'M', code: 'MUG', price: 7.50) }

  it '#eligible? false' do
    items = [voucher, tshirt, mug]
    rule = Rules::BuyTwoGetOne.new(items)
    expect(rule.eligible?).to eq(false)
  end

  context '#calculation' do
    it '2 vouchers' do
      items = [voucher, tshirt, voucher]
      rule = Rules::BuyTwoGetOne.new(items)
      expect(rule.calculation).to eq(-5)
    end

    it '5 vouchers' do
      items = [voucher, tshirt, voucher, voucher, voucher, voucher]
      rule = Rules::BuyTwoGetOne.new(items)
      expect(rule.calculation).to eq(-10)
    end
  end
end
