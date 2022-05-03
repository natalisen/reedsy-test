class Placement < ApplicationRecord
  belongs_to :order, inverse_of: :placements
  belongs_to :item, inverse_of: :placements
end
