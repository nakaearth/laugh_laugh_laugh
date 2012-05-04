class SocialController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @facebook_user=FbGraph::User.new(@user.name,:access_token=>@user.token)
    p @user.name
    p @facebook_user.identifier
    p @facebook_user.name
    @facebook_connect=FbGraph::User.fetch(@user.name.sub("\s","."),:access_token=>@user.token)
    @albums=@facebook_connect.albums
    p @albums
    p @facebook_connect.events
  end
end
