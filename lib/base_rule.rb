class BaseRule
  def initialize(product_codes)
    @codes = Array.new
    product_codes.kind_of?(Array) ? @codes.concat(product_codes) : @codes.push(product_codes)
  end

  def apply(products, current_total)
    current_total
  end
end
