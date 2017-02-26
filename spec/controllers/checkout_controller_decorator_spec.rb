require 'spec_helper'
RSpec.describe Spree::CheckoutController do

  routes { Spree::Core::Engine.routes }
  
  before :each do
    @order = create(:order_with_totals)
  end

  describe 'Checkout payment:' do
    it 'prepare payment for Mollie' do
      expect(patch :update, params: { payment_method_id: 1, state: 'open'}).
        to redirect_to(cart_path)
    end
  end
end