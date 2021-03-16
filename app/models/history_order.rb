class HistoryOrder
  
  include ActiveModel::Model
  attr_accessor :phone_number, :postal_code, :shipping_area_id, :city, :address_line, :building, :item_id, :user_id, :token

  with_options presence: true do
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "Input only number" }
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id, numericality: { other_than: 0, message: "Select"}
    validates :city
    validates :address_line
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    history = History.create(item_id: item_id, user_id: user_id)

    Order.create(phone_number: phone_number, postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, address_line: address_line, history_id: history.id)
  end
end