class Article < ActiveRecord::Base
  has_attachments :photos
  has_many :comments

  CATEGORIES = ["Chroniques judiciaires", "Histoires de justice", "Brèves de prétoires"]

  validates :title, presence: true
  validates :category, inclusion: { in: CATEGORIES, allow_nil: false }
  validates :content, presence: true
end
