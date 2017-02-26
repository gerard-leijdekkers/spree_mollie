require "spec_helper"

RSpec.describe Spree::MollieController do

  routes {Spree::Core::Engine.routes}
  
  shared_examples 'mollie payment is' do |state, order_id|
    let(:order) { create :order_with_pending_mollie_payment }

    it "payment returns the #{state} state" do
      VCR.use_cassette("get_status_#{state}") do
        order.payments.last.update(response_code: order_id)

        expect {
          request_to_controller.call # should be defined by let
        }.to change{ order.reload.payment_state }.from('balance_due').to(state)
      end
    end
  end

  context '#check_payment_status' do
    it_behaves_like 'mollie payment is', 'paid', 'tr_dkiVfRMs4W' do
      let(:request_to_controller) { Proc.new { get :check_payment_status, params: { order_id: order.number }}}
    end
    
    it_behaves_like 'mollie payment is', 'failed', 'tr_kKFSWQRRwy' do
      let(:request_to_controller) { Proc.new { get :check_payment_status, params: { order_id: order.number }}}
    end
  end

  context '#notify' do
    it_behaves_like 'mollie payment is', 'paid', 'tr_dkiVfRMs4W' do
      let(:request_to_controller) { Proc.new { post :notify, params: { id: 'tr_dkiVfRMs4W' }}}
    end

    it_behaves_like 'mollie payment is', 'failed', 'tr_kKFSWQRRwy' do
      let(:request_to_controller) { Proc.new { post :notify, params: { id: 'tr_kKFSWQRRwy' }}}
    end

    describe "when no PaymentMethod available" do
      let(:order) { create(:completed_order_with_pending_payment) }

      it 'raises NoMethodError' do
        expect(lambda { post :notify, params: { id: 'TEST_ID', status: 'paid'}}).
            to raise_error(NoMethodError)
      end
    end
  end
end
