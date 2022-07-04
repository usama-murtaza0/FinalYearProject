class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :products
  has_many :reviews
  has_many :orders
  has_one :cart

  validates_uniqueness_of :contact
  geocoded_by :full_address
  after_validation :geocode

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  mount_uploader :picture, AvatarUploader

  def full_address
    [address, city, state].compact.join(',')
  end

  def disabled?
    deactivated == false
  end

  def active_for_authentication?
    super && !deactivated
  end

end
