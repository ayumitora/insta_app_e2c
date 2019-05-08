class ConfirmationMailer < ApplicationMailer
  def confirmation_mail(confirmation)
    @confirmation = confirmation
    @user = User.find(confirmation.user_id)
    mail to: @user.email, subject: "投稿確認メール"
  end
end
