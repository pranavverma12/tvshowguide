class ShowMailer < ApplicationMailer
  def reminder_show
    @show = params[:show]
    @user = params[:user]
    @channel_name = params[:channel_name]

    mail(to: @user.email, subject: "Reminder your show is going to start in 30 minutes!")
  end
end
