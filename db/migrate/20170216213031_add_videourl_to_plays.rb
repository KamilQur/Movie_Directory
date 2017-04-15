class AddVideourlToPlays < ActiveRecord::Migration
  def change
    add_column :plays, :videourl, :string
  end
end
