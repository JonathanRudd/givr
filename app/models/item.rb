class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_one :pickup

  acts_as_taggable_on :tags

  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
end
