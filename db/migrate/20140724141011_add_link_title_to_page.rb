class AddLinkTitleToPage < ActiveRecord::Migration
  def change
    add_column :alchemy_pages, :link_title, :string
  end
end
