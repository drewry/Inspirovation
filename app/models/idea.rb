class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :subideas  
   
  validates :title, :presence => true
  validates :statement, :presence => true, :length => { :maximum => 120 }
  validates :summary, :presence => true
end
