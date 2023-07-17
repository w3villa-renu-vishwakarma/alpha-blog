class UsersController < ApplicationController
    before_action :require_user, only: [:edit, :update]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def signup
        @user = User.new
    end 
    def index
    @users = User.paginate(page: params[:page], per_page: 2)
    end
    def create
        @user = User.new(user_params)
        @user.save
        session[:user_id] = @user.id
        flash[:notice] = "Login successfully." 
        redirect_to "/"  
    end
    def edit
        @user = User.find(params[:id])
    end
    def update
         @user = User.find(params[:id])
         if @user.update(user_params)
            redirect_to @user
         else 
            render 'edit'
         end
    end
    def show
        @user = User.find(params[:id])
        @articles = @user.articles
  
    end
    def require_same_user
        if current_user != @user
            redirect_to users_path
        end
    end
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        session[:user_id] = nil
        redirect_to "/"

    end
    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
