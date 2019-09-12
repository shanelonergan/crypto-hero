class LoginController < ApplicationController

    def logout
        session.clear
        flash[:notification] = ["Logged out"]
        redirect_to "/"
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to "/users/#{@user.id}/portfolio"
        else
            flash[:errors] = ["Incorrect username or password. Denied."]
            redirect_to new_login_path
        end
    end

end