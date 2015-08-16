require 'base_rule'
require 'bulk_product_discount_rule'
require 'checkout'

describe BulkProductDiscountRule do
  context "when created" do
    it "is a subclass of BaseRule" do
      @rule = BulkProductDiscountRule.new("", {}, {})
      expect(@rule).to be_kind_of(BaseRule)
    end
  end

  describe ".apply" do
    before :each do
      @product = Product.new("product_1", 5.99)
      @thresholds = { "product_1" => 3 }
      @alternate_prices = { "product_1" => 4.99 }
      @rule = BulkProductDiscountRule.new("product_1", @threshold, @alternate_prices)
    end

    context "when threshold for bulk discount is reached" do
      it "changes the item price to the alternate price" do
        @checkout = Checkout.new
        @checkout.scan(@product)
        @checkout.scan(@product)
        @checkout.scan(@product)

        total = @rule.apply(@checkout.items, @checkout.total)
        expect(total).to equal(@alternate_prices["product_1"] * 3)
      end
    end
  end
end
