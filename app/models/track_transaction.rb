class TrackTransaction < ApplicationRecord
  belongs_to :seller,  :class_name => :User, :foreign_key => 'seller_id'
  belongs_to :buyer, :class_name => :User, :foreign_key => 'buyer_id'
  belongs_to :product

  def date_helper
    created_at.strftime("%d %B %Y")
  end
end
