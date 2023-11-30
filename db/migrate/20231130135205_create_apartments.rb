class CreateApartments < ActiveRecord::Migration[7.1]
  def change
    create_table :apartments do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :location

      t.timestamps
    end
  end
end
