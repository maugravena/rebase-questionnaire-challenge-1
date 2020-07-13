class QuestionnaireSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :limit_time, :questions
  def questions
    self.object.questions.map do |question|
      {
        id: question.id,
        description: question.description,
        points: question.points
      }
    end
  end
end
