
class UserController
  def create
    result = UserRegistrationService.register(user_params)

    if result[:success]
      render json: {
        message: 'User created successfully',
        user: result[:user].as_json
      }, status: :created
    else
      render json: { error: 'User creation failed', messages: result[:errors] },
             status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
