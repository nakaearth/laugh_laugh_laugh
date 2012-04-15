class Laugh < ActiveRecord::Base
  belongs_to :user
  validates :laugh, :presence=>true
  scope :latest, order('updated_at desc')
end
