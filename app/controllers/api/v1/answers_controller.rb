class Api::V1::AnswersController < ActionController::API
  def create
    questions = Question.find(params[:id])
    answer = questions.answers.new(answers_params)

    if answer.save
      render json: { "message": 'Resposta criada com sucesso' }, status: :created
    else
      render json: { "message": 'Erro ao criar resposta', "errors": answer.errors }, status: :unprocessable_entity
    end
  end

  private
    def answers_params
      params.require(:answers).permit(:description, :correct)
    end
end
