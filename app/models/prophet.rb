class Prophet < ApplicationRecord
  belongs_to :user

  scope :published_in_x_minutes, -> x_minute { where("published_at < ?", Time.zone.now + x_minute.minutes) }
  scope :not_published, -> { where(published: false) }

  include DateTimeHelper

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
      "#{self.text} \n\n prophetted in #{formatted_date_with_wday(self.created_at)} \n #prophetter https://prophetter.herokuapp.com/"
    end
end
