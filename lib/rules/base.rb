# frozen_string_literal: true

module Rules
  class Error < StandardError; end

  # Base class for checkout rules
  class Base
    def initialize(items)
      @items = items
    end

    # Return calculation if eligible
    def adjustment
      return 0 unless eligible?

      calculation
    end

    # Returns true if calculation can be implemented for this items
    def eligible?
      raise Error, I18n.t('errors.eligible_not_implemented',
                          class_name: self.class.name)
    end

    # Returns amount of discount for items
    def calculation
      raise Error, I18n.t('errors.calculation_not_implemented',
                          class_name: self.class.name)
    end
  end
end
