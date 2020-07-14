class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :description, :points, :answers
  has_many :answers
end
