# frozen_string_literal: true

# test class
class TestRule < Rules::Base
  def eligible?
    true
  end

  def action
    10
  end
end

RSpec.describe 'TestRule' do
  let(:checkout) { Checkout.new }
  it '.rule_adjustment' do
    rule = TestRule.new(checkout)
    expect(rule.rule_adjustment).to eq 10
  end
end
