class Questionnaire < ApplicationRecord
  belongs_to :user
  has_many :questions

  validates :name, uniqueness: { case_sensitive: false, message: "should be unique" }
  validates :name, :description, :limit_time, presence: true
end
