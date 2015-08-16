class BuyOneGetOneFreeRule < BaseRule
  attr_reader :codes

  def initialize(product_codes)
    @codes = Array.new
    product_codes.kind_of?(Array) ? @codes.concat(product_codes) : @codes.push(product_codes)
  end

  def apply(checkout, prices)

  end
end
