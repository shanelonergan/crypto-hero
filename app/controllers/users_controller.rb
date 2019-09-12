class UsersController < ApplicationController
    before_action :set_user, only: [:destroy, :update, :edit, :show, :portfolio]


    def show
        if !@logged_in_user == @user || !@logged_in_user
            flash[:errors] = ["You don't have permission to view that page"]
            redirect_to new_login_path
        end
    end

    def new
        @user = User.new(flash[:attributes])
    end

    def create
        @user = User.new(user_params)
        @user.save ? saved(@user) : error_load(@user)
    end

    def update
        if @user.update(user_params)
          redirect_to @user
        else
          redirect_to edit_user_path(@user)
        end
    end

    def portfolio
      if session[:exchange_amount]
        if session[:buy] == true
            @user.balance -= session[:exchange_amount]
        else
            @user.balance += session[:exchange_amount]
        end
        @user.save
        session[:exchange_amount] = nil
        session[:buy] = nil
      end
    end

    def destroy
        @user.destroy
        flash[:notification] = ["Account Deleted"]
        session[:user_id] = nil
        redirect_to "/"
    end

    private

    def saved(user)
        session[:user_id] = @user.id
        render "portfolio"
    end

    def error_load(user)
        flash[:errors] = user.errors.full_messages
        flash[:attributes] = user.attributes
        redirect_to new_user_path
    end

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(
            :username,
            :email,
            :password,
            :bio,
            :photo_url,
            :balance
        )
    end

end
