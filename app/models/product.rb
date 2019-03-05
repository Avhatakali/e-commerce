class Product < ApplicationRecord
  include PublicActivity::Model
  tracked

  include Paperclip::Glue

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "30x30>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :name, presence: true,
    length: {minimum: 4 }

  validates :price, presence: true,
    length: {minimum: 2 }

  paginates_per 2

  def product_name
    "#{name}"
  end

end
