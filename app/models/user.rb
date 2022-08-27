class User < ApplicationRecord
  has_many :items
  has_many :pickups_as_owner, through: :items, source: :pickups
  has_many :pickups
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ##...Avatar Attachment...##
  has_one_attached :avatar
end
