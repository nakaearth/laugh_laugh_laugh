#coding: utf-8
require 'redis'

class LaughsController < ApplicationController
  # GET /laughs
  # GET /laughs.json
  def index
    ActiveRecord::Base.cache do
      @laughs = Laugh.latest.paginate(:page=>params[:page], :per_page=>10)
    end
    @auth_name = REDIS.get("AUTH_NAME") || "guest user"  if Rails.env.production?
    @auth_name = "guest USER" unless Rails.env.production?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @laughs }
    end
  end

  # GET /laughs/1
  # GET /laughs/1.json
  def show
    ActiveRecord::Base.cache do
      @laugh = Laugh.find(params[:id])
      @auth_name=@laugh.user.name
      REDIS.set("AUTH_NAME",@auth_name)
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @laugh }
    end
  end

  # GET /laughs/new
  # GET /laughs/new.json
  def new
    @laugh = Laugh.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @laugh }
    end
  end

  # GET /laughs/1/edit
  def edit
    @laugh = Laugh.find(params[:id])
  end

  # POST /laughs
  # POST /laughs.json
  def create
    @laugh = Laugh.new(params[:laugh])
    @laugh.user_id= session[:user_id]

    respond_to do |format|
      if @laugh.save
        format.html { redirect_to @laugh, notice: 'Laugh was successfully created.' }
        format.json { render json: @laugh, status: :created, location: @laugh }
      else
        format.html { render action: "new" }
        format.json { render json: @laugh.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /laughs/1
  # PUT /laughs/1.json
  def update
    @laugh = Laugh.find(params[:id])
    @laugh.user_id= sessino[:user_id]
    respond_to do |format|
      if @laugh.update_attributes(params[:laugh])
        format.html { redirect_to @laugh, notice: 'Laugh was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @laugh.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laughs/1
  # DELETE /laughs/1.json
  def destroy
    @laugh = Laugh.find(params[:id])
    @laugh.destroy

    respond_to do |format|
      format.html { redirect_to laughs_url }
      format.json { head :no_content }
    end
  end
  
end
