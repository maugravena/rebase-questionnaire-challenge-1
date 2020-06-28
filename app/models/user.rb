class User < ApplicationRecord
  has_many :questionnaires

  validates :name, :email, presence: true
end
