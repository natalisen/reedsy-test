module Discount
  extend ActiveSupport::Concern

  included do
    def tshirt_discount(count)
      discount = count >= 3 ? 30 : 0
    end

    def mug_discount(count)
      if count.digits.length == 1
        0
      elsif count < 150
        count.digits.last * 2 
      else
        30 
      end
    end
  end
end