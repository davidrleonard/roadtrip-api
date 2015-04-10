class CreateLayers < ActiveRecord::Migration
  def change
    create_table :narratives do |t|
      t.belongs_to :article, index: true
      t.string :narrative_thread
      t.string :photo_url
      t.string :photog_name
      t.string :photog_url
      t.string :caption_content
      t.string :source_url # key value
    end

    create_table :layers do |t|
      t.belongs_to :narrative, index: true
      t.integer :rank
      t.string :type
      t.string :content
      t.string :source_url # key value
    end
  end
end
