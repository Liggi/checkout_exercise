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
      @product = Product.new("product_1", 5.00)
      @thresholds = { "product_1" => 3 }
      @discount_percentages = { "product_1" => 10 }
      @rule = BulkProductDiscountRule.new("product_1", @thresholds, @discount_percentages)
    end

    context "when threshold for bulk discount is reached" do
      it "changes the item price to the discounted price" do
        @checkout = Checkout.new
        @checkout.scan(@product)
        @checkout.scan(@product)
        @checkout.scan(@product)

        total = @rule.apply(@checkout.items, @checkout.total)
        expect(total).to equal((@product.price * 3) - ((@product.price * 3) * @discount_percentages[@product.code] / 100))
      end
    end
  end
end
