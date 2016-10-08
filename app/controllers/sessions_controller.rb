class SessionsController < ApplicationController
  def login
    #Login Form
  end

  def login_attempt
    authorized_user = User.authenticate(params[:_email], params[:_password])
    unless authorized_user
      flash[:notice] = "Invalid Username or Password"
      flash[:type]= "danger"
      render "login"
      return
    end
    if authorized_user.confirmed
      flash[:notice] = "Welcome again, you logged in as #{authorized_user.email}"
      flash[:type]= "success"
      redirect_to(:action => 'home')
    else
      flash[:notice] = "User is not already confirmed"
      flash[:type]= "danger"
      render "login"
    end
  end

  def home
  end

  def logout
  end
end
