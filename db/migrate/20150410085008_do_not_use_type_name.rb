class DoNotUseTypeName < ActiveRecord::Migration
  def change
    change_table :layers do |t|
      # type is reserved by activerecord
      t.remove :type

      # so use category
      t.string :category
    end
  end
end
