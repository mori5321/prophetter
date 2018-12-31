class ProphetterCronService
  def self.exec!
    target_prophets = Prophet.published_in_x_minutes(10).not_published

    target_prophets.find_each do |prophet|
      prophet.tweet!
    end
  end
end
