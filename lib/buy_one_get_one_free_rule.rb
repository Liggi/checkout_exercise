class BuyOneGetOneFreeRule < BaseRule
  attr_reader :codes

  def initialize(product_codes)
    super(product_codes)
  end

  def apply(products, current_total)
    @codes.each do |code|
      matchCount = 0
      products.each do |product|
        if(product.code == code)
          matchCount += 1
          if(matchCount == 2)
            current_total -= product.price
            matchCount = 0
          end
        end
      end
    end

    current_total
  end
end
