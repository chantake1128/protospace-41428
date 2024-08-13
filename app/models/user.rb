class User < ApplicationRecord
  validates :name,presence: true
  validates :profile,presence: true
  validates :occupation,presence: true
  validates :position,presence: true
end
