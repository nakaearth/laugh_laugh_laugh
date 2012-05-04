class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    @user=User.find_by_provider_and_uid(auth["provider"],auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id]=@user.id
    p @user
    redirect_to root_url, :notice => "Signd in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice=> "Logout success!"
  end
end
