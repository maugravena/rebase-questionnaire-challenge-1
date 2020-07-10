class Api::V1::AnswersController < Api::V1::ApiController
  def create
    questions = Question.find(params[:id])
    questions.answers.create!(answers_params)

    render json: { "message": 'Resposta criada com sucesso' }, status: :created
  end

  private
    def answers_params
      params.require(:answers).permit(:description, :correct)
    end
end
