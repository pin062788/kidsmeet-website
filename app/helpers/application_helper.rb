module ApplicationHelper

  AVATARS = %w(cat.png  cow.png  donkey.png  frog.png  mouse.png 
               panda.png  pig.png  sheep.png  tiger.png)

  def avatar_placeholder_url
    "/assets/avatar/#{AVATARS[rand(AVATARS.length)]}"
  end

  def email_logo_url
    "/assets/email/logo.png"
  end

end
