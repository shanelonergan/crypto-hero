class LoginController < ApplicationController

    def new
        render layout: false
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to "/user/:id/portfolio"
        else
            flash[:errors] = [ "Incorrect username or password. Denied."]
            redirect_to new_login_path
        end
    end

end