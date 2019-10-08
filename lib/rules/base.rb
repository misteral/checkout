# frozen_string_literal: true

module Rules
  class Error < StandardError; end

  # Base class for chackout rules
  class Base
    def initialize(checkout)
      raise Error,
            I18n.t('errors.checkout_class_expected') unless checkout.is_a? Checkout

      @checkout = checkout
    end

    def rule_adjustment
      return unless eligible?

      action || 0
    end

    def eligible?
      raise 'eligible? should be implemented in a sub-class of Rule::Base'
    end

    def action
      raise 'action should be implemented in a sub-class of Rule::Base'
    end
  end
end
