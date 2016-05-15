class RenameHearingHeldOnInArticles < ActiveRecord::Migration
  def change
    rename_column :articles, :hearing_held_on, :published_on
    Article.all.each do |article|
      article.published_on = article.created_at
      article.save
    end
  end
end
