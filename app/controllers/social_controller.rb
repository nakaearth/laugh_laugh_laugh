require 'rest-graph'

class SocialController < ApplicationController
  include RestGraph::RailsUtil
  before_filter :filter_setup_rest_graph

  def index
    render :text=>rest_graph.get('me').inspect 
  end
 
  private
  def filter_setup_rest_graph
    rest_graph_setup(:auto_authorize=>true) 
  end
  
end
