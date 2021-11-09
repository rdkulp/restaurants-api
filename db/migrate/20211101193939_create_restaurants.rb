class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :cuisine
      t.string :url
      t.integer :rating
      t.string :description
      t.string :image_urls, array: true

      t.timestamps
    end
  end
end
