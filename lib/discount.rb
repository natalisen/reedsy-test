module Discount
  extend ActiveSupport::Concern

  included do
    def tshirt_discount(count)
      if count >= 3
        discount = 30
      end
    end

    def mug_discount(count)
      if count < 150
        discount = count.digits.last * 2
      else
        discount = 30
      end
    end
  end
end