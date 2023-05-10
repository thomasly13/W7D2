class SessionsController < ApplicationController

  def new
    @user = User.new 
    render :new
  end
  
  def create 
    @user = User.find_by_credential(params[:user][:email], params[:user][:password])
      if @user 
        login!(@user)
        redirect_to user_url(@user)
      else

        flash.now[:errors] = ["Invalid Credentials"]
        @user = User.new(email: params[:user][:email])
        return :new
      end
  end

  def destroy
    logout! 
    flash[:message] = ["Successfully logged out!"]
    redirect_to new_session_url
  end
end
