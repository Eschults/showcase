class Comment < ActiveRecord::Base
  belongs_to :article

  validates :article, :name, :content, presence: true
end
