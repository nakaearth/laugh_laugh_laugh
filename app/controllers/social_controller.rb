require 'rest-graph'

class SocialController < ApplicationController
  def index
    access_toekn=current_user.token
    rg = RestGraph.new(:access_token=>access_token)
    @mes=rg.get('me')
    rg.get('me/likes')
  end
end
