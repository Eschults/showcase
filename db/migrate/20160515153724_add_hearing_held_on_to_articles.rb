class AddHearingHeldOnToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :hearing_held_on, :date
  end
end
