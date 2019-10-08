# frozen_string_literal: true

module Rule
  class Base
    def initialize(checkout)
      @checkout = checkout
    end

    def eligible?
      raise 'Please impmenent in '
    end

    def action
    end
  end
end
