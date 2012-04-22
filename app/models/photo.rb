#coding: utf-8

class Photo < ActiveRecord::Base
  scope :latest  ,order('updated_at desc')
  belongs_to :user
  
  validates :title  ,:presence=>true
  validates_attachment_size :photo ,:in =>1..5.megabyte,:message=>'ファイルサイズが大きすぎます' 
  if Rails.env.production? 
    has_attached_file :photo,
      :storage => :s3,
      :s3_credentials=>"#{Rails.root}/config/s3.yml",
      :styles => { :medium => "350x350>", :thumb => "100x100>",:original=>"700x700>"},
      :url => ":s3_domain_url",
      :path=>"photos/:id/:style/:filename"
  else 
    has_attached_file :photo,
      :url=>"/system/img/attaches/:id/:style/:filename" ,
      :styles => { :medium => "350x350>", :thumb => "100x100>",:original=>"700x700>"}
  end
end
