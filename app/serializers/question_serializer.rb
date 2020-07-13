class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :description, :points, :answers
  def answers
    self.object.answers.map do |answer|
      {
        id: answer.id,
        description: answer.description,
        correct: answer.correct
      }
    end
  end
end
