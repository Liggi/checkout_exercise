require 'checkout'

describe Checkout do

  context "creating" do

    before :each do
      @checkout = Checkout.new
    end

    it "has a zero total" do
      expect(@checkout.total).to equal(0.00)
    end

    it "has no items" do
      expect(@checkout.items).to be_empty
    end
  end

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

    context "given a product code" do
      it "has a matching item" do
        @checkout.scan("product_1")
        expect(@checkout.items).to include("product_1")
      end

      it "contains all scanned items" do
        @checkout.scan("product_1")
        @checkout.scan("product_2")
        @checkout.scan("product_3")
        expect(@checkout.items).to include("product_1") && include("product_2") && include("product_3")
      end
    end

  end

end
