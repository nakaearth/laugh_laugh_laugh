#coding: utf-8

class PointController < ApplicationController
  def give_point
    laugh_id=params[:laugh_id]
    point=params[:point].to_i
    point+=1
    @point = Point.new
    @point.laugh_id = laugh_id
    @point.point = point
    if @point.save
      redirect_to laughs_path    
    else
      ##導線にすべきが
    end
  end
end
