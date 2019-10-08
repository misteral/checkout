RSpec.describe Checkout do
  it 'creates a student class' do
    checkout = Checkout.new(pricing_rules)
    expect(student).to be_kind_of(Checkout)
  end
end
