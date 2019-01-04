class Prophet < ApplicationRecord
  belongs_to :user

  scope :published_in_x_minutes, -> x_minute { where("published_at < ?", Time.zone.now + x_minute.minutes) }
  scope :not_published, -> { where(published: false) }
  scope :publishing_order, -> { order(published_at: :asc)}

  include DateTimeHelper

  def tweet!
    client = TwitterClient.new(self.user)
    if client.post(tweet_text)
      self.update(published: true)
    else
      logger.fatal "Prophet id:#{prophet.id}|Tweet Failed"
    end
  end

  def remaining_date
    remain = (self.published_at.to_date - Date.today).to_i
    remain > 0 ? remain : 0 ;
  end

  private
    def tweet_text
      "https://prophetter.herokuapp.com/prophets/#{self.id} \n#未来日記 #prophetter"
    end
end
