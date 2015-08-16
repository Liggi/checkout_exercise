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
        @rule = BuyOneGetOneFreeRule.new("product_1")
      end

      it "contains a single product code" do
        expect(@rule.codes).to include("product_1")
      end
    end

    context "when given multiple product codes" do
      before :each do
        @rule = BuyOneGetOneFreeRule.new(["product_1", "product_2", "product_3"])
      end

      it "contains all specified product codes" do
        expect(@rule.codes).to include("product_1") && include("product_2") && include("product_3")
      end
    end

    context "when two applicable items are in checkout" do
      it "cuts the price in half" do
        @checkout = Checkout.new

      end
    end
  end
end
