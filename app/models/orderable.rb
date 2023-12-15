class Orderable < ApplicationRecord
  belongs_to :apartment
  belongs_to :cart
  def total
    apartment.price * quantity
  end
end
