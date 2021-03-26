class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :product_link
      t.integer :points
      t.decimal :price

      t.timestamps
    end
  end
end
