class UsersController < ApplicationController
  
  def new
    @user = User.new(:invit_token => params[:invit_token])
    @user.email = @user.invit.recipient_email if @user.invit
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      Mailer.registration_confirmation(@user).deliver
      redirect_to root_url, :notice => "Registered successfully"
    else
      render "new"
    end
  end
  
  def home
    
  end
    
end