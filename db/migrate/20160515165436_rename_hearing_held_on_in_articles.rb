class RenameHearingHeldOnInArticles < ActiveRecord::Migration
  def change
    rename_column :articles, :hearing_held_on, :published_on
  end
end
