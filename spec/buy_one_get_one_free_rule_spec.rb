require 'base_rule'
require 'buy_one_get_one_free_rule'

describe BuyOneGetOneFreeRule do
  context "when created" do
    it "is a subclass of BaseRule" do
      @rule = BuyOneGetOneFreeRule.new("")
      expect(@rule).to be_kind_of(BaseRule)
    end
  end

  describe ".apply" do
    context "when given a single product code" do
      before :each do
        @product = Product.new("product_1", 1.99)
        @rule = BuyOneGetOneFreeRule.new(@product)
      end

      it "contains a single product code" do
        expect(@rule.codes).to include(@product)
      end
    end

    context "when given multiple product codes" do
      before :each do
        @product1 = Product.new("product_1", 1.99)
        @product2 = Product.new("product_2", 1.99)
        @product3 = Product.new("product_3", 1.99)
        @rule = BuyOneGetOneFreeRule.new([@product1, @product2, @product3])
      end

      it "contains all specified product codes" do
        expect(@rule.codes).to include(@product1) && include(@product2) && include(@product3)
      end
    end

    context "when two applicable items are in checkout" do
      before :each do
        @product = Product.new("product_1", 1.99)
        @rule = BuyOneGetOneFreeRule.new(@product)
      end

      it "cuts the price in half" do
        @checkout = Checkout.new
        @checkout.scan(@product)
        @checkout.scan(@product)

        pre_rule_total = @checkout.total
        total = @rule.apply(@checkout.items, @checkout.total)
        expect(total).to equal(pre_rule_total / 2)
      end
    end

    context "when three applicable items are in checkout" do
      before :each do
        @product = Product.new("product_1", 2.99)
        @rule = BuyOneGetOneFreeRule.new(@product)
      end

      it "removes the price of one from the total" do
        @checkout = Checkout.new
        @checkout.scan(@product)
        @checkout.scan(@product)
        @checkout.scan(@product)

        pre_rule_total = @checkout.total
        total = @rule.apply(@checkout.items, @checkout.total)
        expect(total).to equal(pre_rule_total - @product.price)
      end
    end
  end
end
