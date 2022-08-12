class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  acts_as_taggable_on :tags
end
