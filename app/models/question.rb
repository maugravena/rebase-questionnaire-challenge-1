class Question < ApplicationRecord
  belongs_to :questionnaire

  validates :description, :points, presence: true
end
