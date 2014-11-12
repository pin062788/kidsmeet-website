class AttendanceMailer < ActionMailer::Base
  default from: "kidsmeetmaster@gmail.com"

  def send_email(attendance)
    @attendance = attendance
    mail(:to => @attendance.email, :bcc => ["kidsmeetmaster@gmail.com", "Wang Lei <wldandan@gmail.com>"], :subject => "感谢您的关注 [#{attendance.event.title}]")
  end
end
