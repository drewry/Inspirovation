class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea
  
  validates :idea_id, :presence => true
  validates :user_id, :presence => true
  validates :rating_type, :presence => true  
end
