module Spree
  class PaymentMethod::Mollie < PaymentMethod
    preference :api_key, :string
    preference :payment_methods, :string, default: "ideal, creditcard, mistercash, sofort, banktransfer, paypal, bitcoin, podiumcadeaukaart, paysafecard, kbc, belfius"
    
    def payment_profiles_supported?
      false
    end

    def cancel(*)
    end

    def source_required?
      false
    end

    def credit(*)
      self
    end

    def success?
      true
    end

    def authorization
      self
    end
  end
end
