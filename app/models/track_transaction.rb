class TrackTransaction < ApplicationRecord
  belongs_to :product
  belongs_to :user

  belongs_to :user
  belongs_to :status, :class_name => "user"
end
