class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { user: 0, admin: 1 }

  acts_as_favoritor

  has_many :locations, foreign_key: :owner_id, dependent: :nullify
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  has_many :pets, dependent: :destroy
end
