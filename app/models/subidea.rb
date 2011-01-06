class Subidea < ActiveRecord::Base
  belongs_to :idea
  has_one :map
  
  validates :title, :presence => true
  validates :summary, :presence => true
  validates :idea_id, :presence => true
end