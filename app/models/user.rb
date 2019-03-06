class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_one_attached :avatar, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :comments, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,

         :confirmable, :lockable

  enum status: [:seller, :buyer]

  def full_name
    "#{first_name} #{second_name}"
  end

end
