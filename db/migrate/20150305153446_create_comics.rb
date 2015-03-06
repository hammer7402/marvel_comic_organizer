class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.integer :marvel_id,  null: false
      t.string  :title,  null: false
      t.integer :issueNumber
      t.string  :description
      t.string  :isbn
      t.string  :upc
      t.string  :diamondCode
      t.string  :ean
      t.string  :issn
      t.string  :format
      t.integer :pageCount
      t.string  :purchase_url
      t.string  :image_url
      t.string  :creators
    end
  end
end

# id
# title
# issueNumber
# description
# isbn
# upc
# diamondCode
# ean
# issn
# format
# pageCount
# comics[x]["urls"][1]["url"] (purchase page)
# images
# editor
