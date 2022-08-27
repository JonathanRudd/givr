class Notification < ApplicationRecord
  belongs_to :comment, optional: true
  belongs_to :message, optional: true
end
