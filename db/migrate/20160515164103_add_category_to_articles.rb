class AddCategoryToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :category, :string
    Article.all.each do |article|
      article.category = "Chroniques judiciaires"
      article.save
    end
  end
end
