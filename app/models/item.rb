class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  acts_as_taggable_on :tags

  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_title,
    against: [ :title, :description ],
    associated_against: {
      user: [ :address ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
