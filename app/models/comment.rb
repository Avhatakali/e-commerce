class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :comment, presence: true,
    length: {minimum: 5 }
end
