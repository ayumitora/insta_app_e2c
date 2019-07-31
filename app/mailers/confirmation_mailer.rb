class ConfirmationMailer < ApplicationMailer
  # def confirmation_mail(confirmation)
  #   @confirmation = confirmation
  #   @user = User.find(confirmation.user_id)
  #   mail to: @user.email, subject: "投稿確認メール"
  # end
  def confirmation_mail(feed)
    @feed = feed
    mail to: @feed.author_email, subject: "投稿確認メール" if @feed.present?
  end
end
