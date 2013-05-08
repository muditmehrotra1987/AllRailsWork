class Mailer < ActionMailer::Base
  
  default from: "my.actionmailer@gmail.com"

#****************************Method for sendin user invitation mail***************
  def invit(invit, signup_url)
   @signup_url = signup_url
   mail(:to => invit.recipient_email, :subject => 'Hr App Registration Invitation')
   invit.update_attribute(:sent_at, Time.now)
  end

#****************************Method to send registration confirmation mail*********
  def registration_confirmation(user)
    @user = user
    mail(:to => user.email, :subject => "Hr App Registration Confirmation")
  end
  
end