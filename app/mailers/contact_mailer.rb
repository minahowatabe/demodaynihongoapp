class ContactMailer < ApplicationMailer
  def contact_mail(user)
     @user = user 
     
    #  ↓ 投稿者のメールアドレスへ @user.emal
    mail to: "minahohk@hotmail.com", 
    subject: "あなたの「そうだん」に「回答」がつきました。 "  
  
#ツイッタークローンからblogpost時に本人に送信
#mail to: @user.email, subject: "you just posted!"
  end
  
end
