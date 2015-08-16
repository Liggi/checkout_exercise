require 'checkout'

describe Checkout do

  describe ".scan" do

    before :each do
      @checkout = Checkout.new
    end

    context "with a newly created checkout" do
      it "implements a scan method" do
        expect(@checkout).to respond_to(:scan)
      end
    end

    context "given an empty string" do
      it "has no items" do
        @checkout.scan("")
        expect(@checkout.items).to be_empty
      end
    end

  end

end
