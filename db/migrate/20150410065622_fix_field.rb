class FixField < ActiveRecord::Migration
  def change
    change_table :narratives do |t|
      t.remove :photog_url
      t.string :photog_org
    end
  end
end
