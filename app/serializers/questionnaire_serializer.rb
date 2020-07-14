class QuestionnaireSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :limit_time, :questions
  has_many :questions
end
