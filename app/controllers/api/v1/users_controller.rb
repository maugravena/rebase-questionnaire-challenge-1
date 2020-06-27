class Api::V1::UsersController < ActionController::API
  def create
    user = User.new(user_params)

    if user.save
      render json: { "message": 'Usuário criado com sucesso' }, status: :created
    else
      render json: { "message": 'Erro ao criar usuário', "errors": user.errors }, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
