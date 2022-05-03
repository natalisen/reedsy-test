class CreatePlacements < ActiveRecord::Migration[7.0]
  def change
    create_table :placements do |t|
      t.references :order
      t.references :item
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
