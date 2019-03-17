class Link < ApplicationRecord
  # not perfect, but something
  validates :source_url, url: true 

end
