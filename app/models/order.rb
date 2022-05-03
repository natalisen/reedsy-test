class Order < ApplicationRecord

  has_many :placements
  has_many :items, through: :placements

  before_validation :set_total!
  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def set_total!
    self.total = 0
    placements.each do |placement|
      sum = placement.item.price * placement.quantity
      discount = placement.item.item_discount(placement.quantity)
      sum = sum.to_f - percent_of(sum, discount) unless discount.zero?

      self.total += sum
    end
  end

  def build_placements_with_item_ids_and_quantities(item_ids_and_quantities)
    item_ids_and_quantities.each do |item_id_and_quantity|
      id, quantity = item_id_and_quantity # [1,5]
      
      self.placements.build(item_id: id, quantity: quantity)
    end
  end

  def percent_of(num, per)
    num.to_f / 100 * per.to_f
  end
end
