class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_cost_burden
  belongs_to :shipping_area
  belongs_to :delivery_days

  with options presence: true do
    validates :item_name
    validates :item_description
    validates :category_id, numericality: { other_than: 1 }
    validates :item_status_id, numericality: { other_than: 1 }
    validates :shipping_cost_burden_id, numericality: { other_than: 1 }
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :delivery_days_id, numericality: { other_than: 1 }
    validates :price
  end
end
