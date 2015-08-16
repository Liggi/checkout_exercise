require 'base_rule'

describe BaseRule do
  describe ".apply" do
    context "with a newly created base rule" do
      before :each do
        @base_rule = BaseRule.new
      end

      it "implements an apply method" do
        expect(@base_rule).to respond_to(:apply)
      end

      it "returns the current total, unchanged" do
        @checkout = Checkout.new
        @prices = {
          "product_1" => 1.99,
          "product_2" => 7.43
        }

        total_pre_rule = @checkout.total
        @base_rule.apply(@checkout, @prices)
        expect(@checkout.total).to equal(total_pre_rule)
      end
    end
  end
end
