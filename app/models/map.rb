class Map < ActiveRecord::Base
  belongs_to :subidea
  
  validates :cellw, :presence => true
  validates :cellh, :presence => true
  validates :dir, :presence => true
  validates :ico_type, :presence => true
  validates :subidea_id, :presence => true
end
