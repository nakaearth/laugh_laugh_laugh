class CreateLaughs < ActiveRecord::Migration
  def change
    create_table :laughs do |t|
      t.text :laugh
      t.integer :user_id
      t.integer :point

      t.timestamps
    end
  end
end
