class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :products
  has_many :reviews
  has_many :orders

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  mount_uploader :picture, AvatarUploader

  def disabled?
    deactivated == false
  end

  def active_for_authentication?
    super && !deactivated
  end

end
