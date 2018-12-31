class Prophet < ApplicationRecord
  belongs_to :user

  scope :published_in_x_minutes, -> x_minute { where("published_at BETWEEN ? and ?", Time.zone.now, Time.zone.now + x_minute.minutes) }
  scope :not_published, -> { where(published: false) }

  def tweet!
    client = TwitterClient.new(self.user)
    if client.post(self.text)
      self.update(published: true)
    else
      logger.fatal "Prophet id:#{prophet.id}|Tweet Failed"
    end
  end
end
