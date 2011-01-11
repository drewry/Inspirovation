class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :subideas  
  has_many :questions
  has_many :views
  has_many :favorites
  has_many :ratings
  has_many :milestones
   
  validates :title, :presence => true
  validates :statement, :presence => true, :length => { :maximum => 120 }
  validates :summary, :presence => true
end
