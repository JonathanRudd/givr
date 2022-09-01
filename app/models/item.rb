class Item < ApplicationRecord
  belongs_to :user
  has_one :pickup
  has_many_attached :images

  acts_as_taggable_on :tags
  has_many :comments, dependent: :destroy

  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_title,
    against: [ :title, :description ],
    using: {
      tsearch: { prefix: true }
    }

  pg_search_scope :search_by_address,
  associated_against: {
    user: [ :address ]
  },
    using: {
      tsearch: { prefix: true }
    }

  pg_search_scope :search_by_tags,
    against: [ :tag_list ]

  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, through: :user, dependent: :destroy
end
