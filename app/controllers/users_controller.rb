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

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(review_params)
          redirect_to @user, notice: "Account successfully updated!"
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to @user, status: :see_other,
        alert: "User deleted"
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