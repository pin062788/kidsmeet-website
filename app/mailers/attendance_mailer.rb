class AttendanceMailer < ActionMailer::Base
  default from: "kidsmeetmaster@gmail.com"

  def send_email(attendance_id)
    @attendance = Attendance.find(attendance_id)
    mail(:to => @attendance.email, :bcc => [],
         :subject => "感谢您的关注 [#{@attendance.event.title}]")
  end
end
