class BulkProductDiscountRule < BaseRule
  attr_reader :codes, :alternate_prices

  def initialize(product_codes, thresholds, discounts)
    super(product_codes)
    @thresholds = thresholds
    @discounts = discounts
  end

  def apply(products, current_total)
    @codes.each do |code|
      products.each do |product|
        if(product.code == code)
          current_total = current_total - (product.price * @discounts[product.code] / 100)
        end
      end
    end

    current_total
  end
end
