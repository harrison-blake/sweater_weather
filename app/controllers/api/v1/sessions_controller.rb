class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email])
    if user != nil
      render json: UserSerializer.new(user)
    else
      render json: {error: "credentials are bad"}, status: 400
    end
  end
end
