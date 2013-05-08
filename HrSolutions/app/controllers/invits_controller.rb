class InvitsController < ApplicationController
 
  def new
    @invit = Invit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invit }
    end
  end

 def create
    @invit = Invit.new(params[:invit])
    @invit.sender = current_user
    respond_to do |format|
      if @invit.save
          Mailer.invit(@invit, signup_url(@invit.token)).deliver        
          format.html { redirect_to root_url, notice: 'Thank you, invitation sent.' }
          format.json { render json: @invit, status: :created, location: @invit }
      else
          format.html { render action: "new" }
          format.json { render json: @invit.errors, status: :unprocessable_entity }
      end
    end
  end
 
end
