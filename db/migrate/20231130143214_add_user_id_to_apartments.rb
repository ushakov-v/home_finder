class AddUserIdToApartments < ActiveRecord::Migration[7.1]
  def change
    add_reference :apartments, :user, null: false, foreign_key: true
  end
end
