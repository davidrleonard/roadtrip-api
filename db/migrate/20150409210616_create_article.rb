class CreateArticle < ActiveRecord::Migration
  def up
    create_table :articles do |t|
      t.string :key
      t.string :alt_key
      t.string :headline
      t.string :url
      t.string :author_name
      t.string :author_title
    end
  end
 
  def down
    drop_table :articles
  end
end
