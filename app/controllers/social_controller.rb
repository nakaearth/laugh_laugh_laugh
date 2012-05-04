class SocialController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @facebook_user=FbGraph::User.new(@user.name,:access_token=>@user.token)
    p @user.name
    p @facebook_user.identifier
  end
end
