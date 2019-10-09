# frozen_string_literal: true

# test class
class TestRule < Rules::Base
  def eligible?
    true
  end

  def calculation
    10
  end
end

RSpec.describe 'TestRule' do
  let(:checkout) { Checkout.new }
  it '#adjustment with eligible true' do
    rule = TestRule.new(checkout)

    expect(rule.adjustment).to eq 10
  end
  it '#adjustment with eligible false' do
    rule = TestRule.new(checkout)
    allow(rule).to receive(:eligible?).and_return(false)

    expect(rule.adjustment).to eq 0
  end
end
