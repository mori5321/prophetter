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

  private
    def tweet_text
      "https://prophetter.herokuapp.com/prophets/#{self.id} \n\n#{formatted_date_with_wday(self.created_at)}に達成予言された目標です \n#prophetterで目標達成 /"
    end
end
