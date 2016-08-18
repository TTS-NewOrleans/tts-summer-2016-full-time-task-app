class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]

    # Looks in our database for the user. If not there creates a new user
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
    || User.create_with_omniauth(auth)

    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed In!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed Out!"
  end

end
