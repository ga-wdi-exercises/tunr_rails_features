class SessionsController < ApplicationController
  def new
  end

  def create
    # does the user exist with the email provided?
    user = User.find_by(email: params[:email])

    if user
      # does their password match?
      if user.authenticate(params[:password])
        # if so, log them in
        session[:user_id] = user.id
        flash[:notice] = "Logged in as #{user.email}!"
        redirect_to artists_path
      else
        # else, send them back to the log in form
        render :new and return
      end
    else
      # incorrect email (no user with that email)
      # else, send them back to the log in form
      render :new and return
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to artists_path, notice: "Signed out!"
  end

end
