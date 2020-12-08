class SessionsController < ApplicationController

  def create
    email = session_params[:email]
    username = session_params[:username]
    user = User.find_by(email: email, username: username)
    if user
      render json: UserSerializer.new(user).serialize
    else 
      render json: ["Incorrect email or username"]
    end
  end

  def destroy
  end
  
  private

  def session_params
    params.require(:session).permit(:email, :username)
  end

end