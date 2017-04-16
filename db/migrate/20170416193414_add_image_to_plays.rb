class AddImageToPlays < ActiveRecord::Migration
  def change
    add_column :plays, :image, :string
  end
end
