class DailyReminderMailer < ApplicationMailer
  def daily_reminder(user)
    @user = user
    mail(to: user.email, subject: "[💰EXPENSES] Daily reminder!")
  end
end
