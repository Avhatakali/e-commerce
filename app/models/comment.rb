class Comment < ApplicationRecord
  belongs_to :product, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates :comment, presence: true,
    length: {minimum: 5 }
end
