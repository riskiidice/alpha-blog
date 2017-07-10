class UsersController < ApplicationController
      before_action :set_user, only: [:edit, :update, :show, :destroy]
      
    def index
        @users = User.paginate(page: params[:page], per_page: 5)
    end
        
    def new 
        
    end
    
    def create
        @user = User.new(user_params)
       
       if @user.save
            flash[:success] = "Welcome to Alpha Blog #{@user.username} your id is #{@user.id}"
            redirect_to articles_path
        else
            render 'new'
        end
    end
    
    def edit
        
    end
    
    def update
        if @user.update(user_params)
            flash[:success] = "You account was updated successfully"
            redirect_to articles_path
        else
            render 'edit'
        end
    end
    
    def show
         @user_articles = @user.articles.paginate(page: params[:page], per_page: 2)
    end
    
    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    
    def set_user
        @user = User.find(params[:id])
    end
end