class User < ApplicationRecord
  # Devise modules — add :confirmable, :lockable, etc. if you enable them later
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { user: 0, admin: 1 }

  acts_as_favoritor

  has_many :locations, foreign_key: :owner_id, dependent: :nullify
  has_many :reviews, dependent: :destroy
end
