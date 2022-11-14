class UsersController < ApplicationController
    def index
        @user = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(review_params)
            if @user.save
                    redirect_to @user, notice: "Thank you for signing up"
                else
                    render :new, status: :unprocessable_entity
            end
    end
end

private

    def review_params
        review_params = params.require(:user).
          permit(:name,
            :email,
            :password,
            :password_confirmation)
    end