# frozen_string_literal: true

module Rules
  # Buy two of the same product, get one free rule
  class BuyTwoGetOne < Base
    def eligible?
      return true if @items.select { |p| p.code == 'VOUCHER' }.size >= 2

      false
    end

    def calculation
      vouchers = @items.select { |p| p.code == 'VOUCHER' }
      dbl_size = vouchers.size / 2
      price = vouchers.first.price

      dbl_size.to_f * price * -1
    end
  end
end
