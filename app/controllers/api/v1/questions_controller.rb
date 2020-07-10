class Api::V1::QuestionsController < Api::V1::ApiController
  def create

    questionnaire = Questionnaire.find(params[:id])
    questionnaire.questions.create!(questions_params)

    render json: { "message": 'Questão criado com sucesso' }, status: :created
    
  end

  private
    def questions_params
      params.require(:questions).permit(:description, :points)
    end
end
