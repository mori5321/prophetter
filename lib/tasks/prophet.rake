namespace :prophetter do
  desc "達成予定日になったProphetをツイート"
  task tweet: :environment do
    ProphetterCronService.exec!
  end
end

