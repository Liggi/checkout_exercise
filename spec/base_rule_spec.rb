require 'base_rule'

describe BaseRule do
  describe ".apply" do
    context "when created" do
      before :each do
        @base_rule = BaseRule.new("")
      end

      it "implements an apply method" do
        expect(@base_rule).to respond_to(:apply)
      end

      it "returns the current total, unchanged" do
        @checkout = Checkout.new

        total = @base_rule.apply(@checkout.items, @checkout.total)
        expect(total).to equal(@checkout.total)
      end
    end
  end
end
