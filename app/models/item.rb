class Item < ApplicationRecord

  include Discount

  has_many :placements
  has_many :orders, through: :placements

  def mug?
    self.code == "MUG"
  end

  def tshirt?
    self.code == "TSHIRT"
  end

  def item_discount(quantity)
    discount = 0
    if self.mug?
      discount = mug_discount(quantity)
    elsif self.tshirt?
      discount = tshirt_discount(quantity)  
    end
    discount
  end
end
