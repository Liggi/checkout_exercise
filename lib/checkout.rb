class Checkout
  attr_reader :items

  def initialize
    @items = Array.new
  end

  def scan(product_code)
    @items << product_code unless product_code.empty?
  end
end
