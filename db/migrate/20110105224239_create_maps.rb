class CreateMaps < ActiveRecord::Migration
  def self.up
    create_table :maps do |t|
      t.string :cellw
      t.string :cellh
      t.string :dir
      t.integer :ico_type
      t.integer :subidea_id

      t.timestamps
    end
  end

  def self.down
    drop_table :maps
  end
end
