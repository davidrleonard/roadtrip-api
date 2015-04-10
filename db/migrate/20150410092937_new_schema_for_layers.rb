class NewSchemaForLayers < ActiveRecord::Migration
  def change
    change_table :layers do |t|
      # remove specific types, let's go generic
      t.remove :history_question
      t.remove :history_answer

      # these will be used for history, trivia, backstory
      t.string :question
      t.string :answer

      # used for location (aka building maps)
      t.float :lon
      t.float :lat
      t.integer :zoom_level

      # used for location + number to describe the content
      t.string :description_text

      # used for the big number
      t.string :callout_number

      # used just for quote
      t.string :quote_text
      t.string :quote_attribution
    end
  end
end
