class UsersController < ApplicationController
    before_action :set_user, only: [:delete, :update, :edit, :show, :portfolio]

    def login
    end

    def new
        @user = User.new(flash[:attributes])
        render layout: false
    end

    def create
        @user = User.new(user_params)
        # @user.save ? (redirect_to @user) : error_load(@user)
        # if @user.save
        #     session[:user_id] = @user.id
        #     render "portfolio"
        # else
        #     error_load(@user)
        # end
        @user.save ? saved(@user) : error_load(@user)
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
