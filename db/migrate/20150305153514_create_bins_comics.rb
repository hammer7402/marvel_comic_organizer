class CreateBinsComics < ActiveRecord::Migration
  def change
    create_table :bins_comics do |t|
      t.integer :bin_id
      t.integer :comic_id
    end
    add_index :bins_comics, :bin_id
    add_index :bins_comics, :comic_id
  end
end
