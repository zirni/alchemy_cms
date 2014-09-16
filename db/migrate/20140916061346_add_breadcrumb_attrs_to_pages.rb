class AddBreadcrumbAttrsToPages < ActiveRecord::Migration
  def change
    add_column :alchemy_pages, :breadcrumb_link_text, :string
    add_column :alchemy_pages, :breadcrumb_link_title, :string
  end
end
