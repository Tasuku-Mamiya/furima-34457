class History < ApplicationRecord
  has_one :order
  belongs_to :user
  belongs_to :item
end
