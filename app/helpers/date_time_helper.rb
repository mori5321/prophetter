module DateTimeHelper
  def formatted_date_with_wday(time)
    time.strftime("%Y/%m/%d") + " " + %w(Sun Mon Tue Wed Thu Fri Sat)[time.wday] + " " + time.strftime("%H:%M")
  end
end
