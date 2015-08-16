require 'checkout'
require 'product'

describe Checkout do

  context "when created" do

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

    context "given nil" do
      it "has no items" do
        @checkout.scan(nil)
        expect(@checkout.items).to be_empty
      end
    end

    context "given a product" do
      it "has a matching item" do
        @product = Product.new("product_1", 1.99)
        @checkout.scan(@product)
        expect(@checkout.items).to include(@product)
      end

      it "contains all scanned items" do
        @product1 = Product.new("product_1", 1.99)
        @product2 = Product.new("product_2", 1.99)
        @product3 = Product.new("product_3", 1.99)
        @checkout.scan(@product1)
        @checkout.scan(@product2)
        @checkout.scan(@product3)
        expect(@checkout.items).to include(@product1) && include(@product2) && include(@product3)
      end
    end

  end

end
