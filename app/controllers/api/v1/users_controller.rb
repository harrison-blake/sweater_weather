class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(email: params[:user][:email],
                     password: params[:user][:password],
        password_confirmation: params[:user][:password_confirmation]
    )

    if user.save
      user.api_key = Generator.generate_api_key
      user.save
      render json: UserSerializer.new(user)
    else
      render json: {error: user.errors.full_messages.to_sentence}, status: 400
    end
  end
end
