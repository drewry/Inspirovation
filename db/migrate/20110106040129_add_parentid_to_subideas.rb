class AddParentidToSubideas < ActiveRecord::Migration
  def self.up
    add_column :subideas, :parent_id, :integer
  end

  def self.down
    remove_column :subideas, :parent_id
  end
end
