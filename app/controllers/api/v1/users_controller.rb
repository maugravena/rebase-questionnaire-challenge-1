class Api::V1::UsersController < Api::V1::ApiController
  def create
    User.create!(user_params)

    render json: { "message": 'Usuário criado com sucesso' }, status: :created
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
