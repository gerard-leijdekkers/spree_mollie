#spec/models/spree/payment_method/mollie_spec.rb

require 'spec_helper'

describe Spree::PaymentMethod::Mollie do

  describe "preferences" do
    let(:mollie) { Spree::PaymentMethod::Mollie.new(name: "Mollie") }
    
    it "can save an api_key attribute" do
      mollie.set_preference(:api_key, "my-awesome-key")
      mollie.save!
      expect(mollie.get_preference(:api_key)).to eql "my-awesome-key"
    end
    
    it "can save preferred payment_methods" do
      mollie.set_preference(:payment_methods, "ideal, creditcard")
      mollie.save!
      expect(mollie.get_preference(:payment_methods)).to eql "ideal, creditcard"
    end
  end
end


