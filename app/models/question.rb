class Question < ActiveRecord::Base
  belongs_to :idea
  
  validates :title, :presence => true
  validates :idea_id, :presence => true
end
