#coding: utf-8

class PhotosController < ApplicationController
  
  def index
    @photos=Photo.where('user_id=?',session[:user_id]).latest.paginate(:per_page=>10,:page=>params[:page])
  end
  def show
    @photo=Photo.find(params[:id])
  end

  def new
    @photo=Photo.new  
  end

  def create
    @photo=Photo.new(params[:photo])
    @photo.user_id=session[:user_id]
    respond_to do |format|
      if @photo.save
        format.html {redirect_to @photo, notice: '画像アップロード完了'}
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @photo=Photo.find(params[:id]) 
  end

  def update
    @photo=Photo.find(params[:id])
    @photo.user_id=session[:user_id]
    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html {redirect_to @photo, notice: '画像アップロード完了'}
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @photo=Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_url, notice: '写真を削除しました'
  end
end
