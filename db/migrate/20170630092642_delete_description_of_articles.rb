class DeleteDescriptionOfArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :descriptionm
  end
end
