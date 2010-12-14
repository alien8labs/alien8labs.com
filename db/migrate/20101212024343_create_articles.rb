class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string        :title,         :null => false
      t.text          :abstract,      :null => false
      t.text          :body,          :null => false
      t.integer       :user_id,       :null => false
      t.date          :published_on
      t.timestamps
    end

    add_index :articles, :user_id
  end

  def self.down
    drop_table :articles
  end
end
