class SessionsController < ApplicationController

  before_filter :authenticate_user, :only => [:home]
  before_filter :save_login_state, :only => [:login, :login_attempt]

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
      session[:user_id] = authorized_user.id
      redirect_to(:action => 'home')
    else
      flash[:notice] = "User is not already confirmed"
      flash[:type]= "danger"
      render "login"
    end
  end

  def home
    @users = User.all
    @categories = Category.all
    @requests = Request.all
    @informations = Information.all
  end

  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
  end

  def accept
    @request = Request.find_by_id(params[:_requestId])
    Category.transform(@request)
    redirect_to :action => 'home', :anchor => "requests"
  end

  def reject
    @request = Request.find_by_id(params[:_requestId])
    Request.delete(@request)
    redirect_to :action => 'home', :anchor => "requests"
  end

  def activateUser
    @user = User.find_by_id(params[:_userId])
    @user.confirmed = true
    @user.save
    redirect_to :action => 'home', :anchor => "users"
  end

  def blockUser
    @user = User.find_by_id(params[:_userId])
    @user.confirmed = false
    @user.save
    redirect_to :action => 'home', :anchor => "users"
  end

  def deleteUser
    @user = User.find_by_id(params[:_userId])
    User.delete(@user)
    redirect_to :action => 'home', :anchor => "users"
  end

  def deleteCategory
    @category = Category.find_by_id(params[:_categoryId])
    Category.delete(@category)
    redirect_to :action => 'home', :anchor => "categories"
  end

  def deleteInformation
    @information = Information.find_by_id(params[:_informationId])
    Information.delete(@information)
    redirect_to :action => 'home', :anchor => "information"
  end

  def makePublic
    @information = Information.find_by_id(params[:_informationId])
    @information.public = true
    @information.save
    redirect_to :action => 'home', :anchor => "information"
  end

  def makePrivate
    @information = Information.find_by_id(params[:_informationId])
    @information.public = false
    @information.save
    redirect_to :action => 'home', :anchor => "information"
  end

end
