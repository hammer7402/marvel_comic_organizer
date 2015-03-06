class CreateBins < ActiveRecord::Migration
  def change
    create_table :bins do |t|
      t.string :bin, :default => "N/A"
      t.references :user
    end
  end
end
