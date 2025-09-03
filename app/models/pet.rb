class Pet < ApplicationRecord
  belongs_to :user
  SIZES = ['large', 'medium', 'small']

  validates :name, presence: true
  validates :size, presence: true, inclusion: {in: SIZES}
  validates :breed, presence: true
end
