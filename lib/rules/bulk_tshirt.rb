# frozen_string_literal: true

module Rules
  # Buy 3 or more TSHIRT items, the price per unit should be 19.00
  class BulkTshirt < Base
    def eligible?
      return true if @items.select { |p| p.code == 'TSHIRT' }.size >= 3

      false
    end

    def calculation
      tshirts = @items.select { |p| p.code == 'TSHIRT' }

      all_amount = tshirts.map(&:price).sum
      diff_amount = 19 * tshirts.size

      diff_amount - all_amount
    end
  end
end
