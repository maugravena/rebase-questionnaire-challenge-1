class Question < ApplicationRecord
  belongs_to :questionnaire
  has_many :answers

  validates :description, :points, presence: true
end
