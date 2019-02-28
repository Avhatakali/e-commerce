class Product < ApplicationRecord
  include PublicActivity::Model
  tracked
  
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :name, presence: true,
    length: {minimum: 4 }

  validates :price, presence: true,
    length: {minimum: 2 }

  paginates_per 2

end
