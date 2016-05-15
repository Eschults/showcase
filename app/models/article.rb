class Article < ActiveRecord::Base
  has_attachments :photos
end
