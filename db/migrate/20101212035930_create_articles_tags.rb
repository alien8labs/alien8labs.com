class CreateArticlesTags < ActiveRecord::Migration
  def self.up
    create_table :articles_tags, :id => false do |t|
      t.integer :article_id, :null => false
      t.integer :tag_id,     :null => false
    end

    add_index :articles_tags, :article_id
    add_index :articles_tags, :tag_id
  end

  def self.down
    drop_table :articles_tags
  end
end
