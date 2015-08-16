require 'checkout'

describe Checkout do

  describe ".scan" do

    before :each do
      @checkout = Checkout.new
    end

    context "given an empty string" do
      it "has no items" do
        expect(@checkout.items).to be_empty
      end
    end

  end

end
