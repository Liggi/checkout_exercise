class Shop
  def initialize(stock, pricing_rules)
    @stock = stock
    @checkout = Checkout.new(pricing_rules)
  end
end
