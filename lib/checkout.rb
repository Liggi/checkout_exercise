class Checkout
  attr_reader :items, :total

  def initialize
    @items = Array.new
    @total = 0.00
  end

  def scan(product_code)
    @items << product_code unless product_code.empty?
  end
end
