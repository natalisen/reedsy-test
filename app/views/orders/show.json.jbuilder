json.extract! @order, :id, :total

json.items(@order.placements) do |placement| 
  json.extract! placement, :quantity
  json.extract! placement.item, :code, :price
end