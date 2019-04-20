class ConfirmationMailer < ApplicationMailer
  def confirmation_mail(confirmation)
    @confirmation = confirmation

    mail to: "0araiayumi0@gmail.com", subject: "投稿確認メール"
  end
end
