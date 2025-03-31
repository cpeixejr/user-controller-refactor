class UserRegistrationService
  def self.register(user_params)
    user = User.new(user_params)

    if user.save
      UserMailerWorker.perform_async(user.id)
      return { success: true, user: user }
    else
      return { success: false, errors: user.errors.full_messages }
    end
  end
end
