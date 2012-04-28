require 'rest-graph'

class SocialController < ApplicationController
  include RestGraph::RailsUtil
  def index
    access_token=current_user.token

    p 'NAME::::'+current_user.name
    p 'TOKEH::::'+access_token
    rg = RestGraph.new(:access_token=>access_token)
    p rg
    @mes=rg.get('me')
    rg.get('me/likes')
    render :text => rest_graph.get('me/home').inspect
  end
end
