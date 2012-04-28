class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
	before_filter :correct_user, :only => [:edit, :update]
	before_filter :admin_user,   :only => :destroy

  def show
		@user = User.find(params[:id])
		@microposts = @user.microposts.paginate(:page => params[:page])
		@title = @user.name
  end
  
  def new 
  	@curUser = current_user
  	if @curUser.nil?
  		@user = User.new
			@title = "Sign up"	
  	else
			#this is not new user so rout it to root page
  		redirect_to root_path
		end
  end

	def create
	  @curUser = current_user
	  if @curUser.nil?
			@user = User.new(params[:user])
			if @user.save
				sign_in @user
				flash[:success] = "Welcome to the Sample App!"
				redirect_to @user
			else
				@title = "Sign up"
				@user.password.clear 
				@user.password_confirmation.clear
				render 'new'
			end
		end
	end
	
	def edit
		@user = User.find(params[:id])
		@title = "Edit user"
	end
	
	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			flash[:success] = "Profile updated."
			redirect_to @user
		else
			@title = "Edit user"
			render 'edit'
		end
	end
	
	def index	  
		@title = "All users"
		@users = User.paginate(:page => params[:page])
	end
	
	def destroy
	  user = User.find(params[:id])
		if current_user?(user)
			flash[:error] = "You can't delete admin."
		else
			user.destroy
			flash[:success] = "User destroyed."
		end
		redirect_to users_path
	end


	private
		
		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_path) unless current_user?(@user)
		end

		def admin_user
			redirect_to(root_path) unless current_user.admin?
		end


end
