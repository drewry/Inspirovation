class CreateSubideas < ActiveRecord::Migration
  def self.up
    create_table :subideas do |t|
      t.string :title
      t.text :summary
      t.integer :idea_id

      t.timestamps
    end
  end

  def self.down
    drop_table :subideas
  end
end
