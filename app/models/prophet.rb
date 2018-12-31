class Prophet < ApplicationRecord
  belongs_to :user

  scope :published_in_x_minutes, -> x_minute { where("published_at < ?", Time.zone.now + x_minute.minutes) }
  scope :not_published, -> { where(published: false) }

  def tweet!
    client = TwitterClient.new(self.user)
    if client.post(tweet_text)
      self.update(published: true)
    else
      logger.fatal "Prophet id:#{prophet.id}|Tweet Failed"
    end
  end

  private
    def tweet_text
      "#{self.text} /#{self.created_at}からの予言 #profetter https://prophetter.herokuapp.com/"
    end
end
