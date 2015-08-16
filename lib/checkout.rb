class Checkout
  attr_reader :items, :total

  def initialize
    @items = Array.new
    @total = 0.00
  end

  def scan(product)
    unless product.nil? || !product.is_valid?
      @items << product unless product.nil? || !product.is_valid?
      @total += product.price
    end
  end
end
