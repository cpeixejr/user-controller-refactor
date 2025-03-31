
class UserController
  def create
    @user = User.new(user_params)

    if @user.save
      UserMailerWorker.perform_async(@user.id)
      render json: {
        message: 'User created successfully',
        user: @user.as_json
      }, status: :created
    else
      render json: { error: 'User creation failed', messages: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
