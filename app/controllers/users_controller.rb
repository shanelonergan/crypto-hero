class UsersController < ApplicationController
    before_action :set_user, only: [:delete, :update, :edit, :show, :portfolio]

    def login
    end

    # def new
    #     @user = User.new(flash[:errors])
    # end

    # def create
    #     @user = User.create(user_params)
    # end

    private

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
