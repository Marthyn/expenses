class DailyReminderMailerPreview
  def daily_reminder
    DailyReminderMailer.daily_reminder(User.first)
  end
end
