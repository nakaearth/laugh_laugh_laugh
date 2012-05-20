class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :laugh_id
      t.integer :point

      t.timestamps
    end
  end
end
