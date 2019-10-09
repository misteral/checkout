# frozen_string_literal: true

RSpec.describe Checkout do
  it '#products' do
    expect(subject.products).to be_kind_of(Array)
  end

  it '#scan' do
    subject.scan('VOUCHER')
    items = subject.items.select { |p| p.code == 'VOUCHER' }
    expect(items.count).to eq 1
  end

  context '#total' do
    let(:voucher) { Product.new(name: 'V', code: 'VOUCHER', price: 5) }
    let(:tshirt) { Product.new(name: 'T', code: 'TSHIRT', price: 20) }
    let(:mug) { Product.new(name: 'M', code: 'MUG', price: 7.50) }

    before do
      subject.products = [voucher, tshirt, mug]
    end

    # Items: VOUCHER, TSHIRT, MUG
    # Total: 32.50
    it '' do
      subject.scan('VOUCHER')
      subject.scan('TSHIRT')
      subject.scan('MUG')

      expect(subject.total).to eq 32.50
    end

    # Items: VOUCHER, TSHIRT, VOUCHER
    # Total: 25.00
    it '' do
      subject.scan('VOUCHER')
      subject.scan('TSHIRT')
      subject.scan('VOUCHER')

      expect(subject.total).to eq 25.0
    end

    # Items: TSHIRT, TSHIRT, TSHIRT, VOUCHER, TSHIRT
    # Total: 81.00
    it '' do
      items = %w[TSHIRT TSHIRT TSHIRT VOUCHER TSHIRT]
      items.map { |i| subject.scan(i) }

      expect(subject.total).to eq 81.00
    end

    # Items: VOUCHER, TSHIRT, VOUCHER, VOUCHER, MUG, TSHIRT, TSHIRT
    # Total: 74.50
    it '' do
      items = %w[VOUCHER TSHIRT VOUCHER VOUCHER MUG TSHIRT TSHIRT]
      items.map { |i| subject.scan(i) }

      expect(subject.total).to eq 74.50
    end
  end
end
