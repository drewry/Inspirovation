class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea
  
  validates :idea_id, :presence => true
  validates :user_id, :presence => true
end
