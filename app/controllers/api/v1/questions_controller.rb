class Api::V1::QuestionsController < ActionController::API
  def create
    questionnaire = Questionnaire.find(params[:id])
    questions = questionnaire.questions.new(questions_params)

    if questions.save
      render json: { "message": 'Questão criado com sucesso' }, status: :created
    else
      render json: { "message": 'Erro ao criar a questão', "errors": questions.errors }, status: :unprocessable_entity
    end
  end

  private
    def questions_params
      params.require(:questions).permit(:description, :points)
    end
end
