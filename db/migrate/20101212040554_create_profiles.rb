class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :first_name, :null => false
      t.string :last_name,  :null => false
      t.integer :user_id,   :null => false
      t.timestamps
    end

    add_index :profiles, :user_id
  end

  def self.down
    drop_table :profiles
  end
end
