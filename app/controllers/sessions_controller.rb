class SessionsController < ApplicationController

  def new
  end

  def create
 # searched in database for suer with specifications in params hash
 # downcase as stored downcase
    user = User.find_by(email: params[:session][:email].downcase)

 # user is not nil and password in the params hash matches
 # conditional statement so that it will exit early if user is nil because it checks that first.
 # this order of execution is to prevent a null pointer exception when user.authenticate is called if user is nil
 # if the user is successfuly authenticated, we call a create_session function (See SessionHelper displays notice and redirects to root path
 # if user is unsuccessfuly authenticated, error flash and rendered the new view.
    if user && user.authenticate(params[:session][:password])
      create_session user
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash[:error] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
 # #3 deletes a user's session using the destory_session(see SessionHelper)
    destroy_session(current_user)
    flash[:notice] = "You've been signed out, come back soon!"
    redirect_to root_path
  end


end
