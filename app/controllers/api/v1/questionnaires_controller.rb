class Api::V1::QuestionnairesController < Api::V1::ApiController
  def index
    @questionnaires = Questionnaire.all

    render json: @questionnaires
  end

  def show
    @questionnaires = Questionnaire.find(params[:id])
    render json: @questionnaires
  end

  def create
    user = User.find(params[:id])
    questionnaire = user.questionnaires.create!(questionnaire_params)

    render json: { "message": 'Questionário criado com sucesso' }, status: :created
  end

  private
    def questionnaire_params
      params.require(:questionnaire).permit(:name, :description, :limit_time)
    end
end
