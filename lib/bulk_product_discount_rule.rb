class BulkProductDiscountRule < BaseRule
  attr_reader :codes, :alternate_prices

  def initialize(product_codes, thresholds, alternate_prices)
    super(product_codes)
    @thresholds = thresholds
    @alternate_prices = alternate_prices
  end

  def apply(products, current_total)
    current_total
  end
end
