class AddHeadTitleToPages < ActiveRecord::Migration
  def change
    add_column :alchemy_pages, :head_title, :string
  end
end
