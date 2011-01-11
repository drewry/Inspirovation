class CreateMilestones < ActiveRecord::Migration
  def self.up
    create_table :milestones do |t|
      t.integer :complete
      t.datetime :due
      t.integer :idea_id
      t.text :summary

      t.timestamps
    end
  end

  def self.down
    drop_table :milestones
  end
end
