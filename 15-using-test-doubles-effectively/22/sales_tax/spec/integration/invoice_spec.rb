require 'invoice'

RSpec.describe Invoice do
  let(:address) { Address.new(zip: '98122') } # Seattle zip
  let(:items) { [Item.new(cost: 30), Item.new(cost: 70)] }

  it 'calculates the total' do
    invoice = Invoice.new(address, items)

    # Seattle's tax rate is 9.6%
    expect(invoice.calculate_total).to eq(109.60)
  end
end
