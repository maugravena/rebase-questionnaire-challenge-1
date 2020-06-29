class Api::V1::QuestionnairesController < ActionController::API
  def index
    @questionnaires = Questionnaire.all

    render json: @questionnaires
  end

  def show
    @questionnaires = Questionnaire.find(params[:id])
    render json: @questionnaires
    rescue ActiveRecord::RecordNotFound # Ruby Error Handling
      render status: 404, json: ''
  end

  def create
    user = User.find(params[:id])
    questionnaire = user.questionnaires.new(questionnaire_params)

    if questionnaire.save
      render json: { "message": 'Questionário criado com sucesso' }, status: :created
    else
      render json: { "message": 'Erro ao criar questionário', "errors": questionnaire.errors }, status: :unprocessable_entity
    end
  end

  private
    def questionnaire_params
      params.require(:questionnaire).permit(:name, :description, :limit_time)
    end
end
