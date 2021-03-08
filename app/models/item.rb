class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_cost_burden
  belongs_to :shipping_area
  belongs_to :delivery_day

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_description
    validates :category_id, numericality: { other_than: 1, message: "Select"}
    validates :item_status_id, numericality: { other_than: 1, message: "Select"}
    validates :shipping_cost_burden_id, numericality: { other_than: 1, message: "Select"}
    validates :shipping_area_id, numericality: { other_than: 0, message: "Select"}
    validates :delivery_day_id, numericality: { other_than: 1, message: "Select"}
    validates :price
  end
  validates :price, numericality: { only_integer: true, message: "Half-width number" }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
end
