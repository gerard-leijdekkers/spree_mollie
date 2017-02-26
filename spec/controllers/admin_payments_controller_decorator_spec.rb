require 'spec_helper'

RSpec.describe Spree::Admin::PaymentsController do
  
  routes { Spree::Core::Engine.routes }
  stub_authorization!
  
  context 'when payment is complete' do
    before do
      @order = create(:order_paid_by_mollie)
      @payment = @order.payments.last
      @payment.update(response_code: 'tr_Et8BmUSq7B')
    end

    it 'refunding changes state to void' do
      VCR.use_cassette('refund_success') do
        expect {
          post :mollie_refund, params: { order_id: @order.id, id: @payment.id }
        }.to change{ @order.reload.payments.last.state }.from('completed').to('void')
      end
    end
  end
end
