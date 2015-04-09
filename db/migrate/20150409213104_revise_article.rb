class ReviseArticle < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.string :source_url
      t.string :article_narratives_json
      t.remove :alt_key
      t.remove :url
    end
  end
end
