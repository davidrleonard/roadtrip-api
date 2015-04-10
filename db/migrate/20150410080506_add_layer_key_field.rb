class AddLayerKeyField < ActiveRecord::Migration
  def change
    change_table :layers do |t|
      # key value we need for relationships
      t.string :photo_url

      # for images in all post types
      t.string :image_path

      # for history
      t.string :history_question
      t.string :history_answer
    end
  end
end
