class CreateWatchLists < ActiveRecord::Migration
  def change
    create_table :watch_lists do |t|
      t.string :name
      t.text :stocks

      t.timestamps
    end
  end
end
