class Product < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :name, presence: true,
    length: {minimum: 4 }

  validates :price, :quantity, presence: true,
    length: {minimum: 2 }
end
