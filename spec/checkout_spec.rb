# frozen_string_literal: true

RSpec.describe Checkout do
  it '#products' do
    expect(subject.products).to be_kind_of(Array)
  end

  it '#scan' do

  end
end
