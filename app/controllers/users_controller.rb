class UsersController < ApplicationController
    before_action :set_user, only: [:delete, :update, :edit, :show, :portfolio]

    def login
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(
            :name,
            :email,
            :password,
            :bio,
            :photo_url,
            :balance
        )
    end

end
