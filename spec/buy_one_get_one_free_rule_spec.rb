require 'base_rule'
require 'buy_one_get_one_free_rule'

describe BuyOneGetOneFreeRule do
  describe ".apply" do
    context "when created" do
      before :each do
        @rule = BuyOneGetOneFreeRule.new
      end

      it "is a subclass of BaseRule" do
        expect(@rule).to be_kind_of(BaseRule)
      end
    end
  end
end
