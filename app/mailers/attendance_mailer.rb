class AttendanceMailer < ActionMailer::Base
  default from: "no-reply@kidsmeet.cn"

  def send_email(attendance_id)
    #require 'byebug'; debugger

    @attendance = Attendance.find(attendance_id)
    @email_info = {:logo => "#{CONFIG['email_image_host']}/assets/email/logo_with_brand.png"}

    mail(:to => @attendance.email, :bcc => [],
         :subject => "感谢您的关注 [#{@attendance.event.title}]")
  end
end
