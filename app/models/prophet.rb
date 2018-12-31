class Prophet < ApplicationRecord
  belongs_to :user

  scope :published_in_five_minutes, -> { where("published_at BETWEEN ? and ?", Time.zone.now, Time.zone.now + 5.minutes) }
  scope :not_published, -> { where(published: false) }
end
