class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :prototype, dependent: :destroy
  has_many :comment,   dependent: :destroy
  
  validates :name,presence: true
  validates :profile,presence: true
  validates :occupation,presence: true
  validates :position,presence: true
end
