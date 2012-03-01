class UsersController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if current_user.is_artist?
      if @user.update_attributes(params[:user])
        flash[:notice] = "Successfully updated User."
        redirect_to root_path
      else
        render :action => 'edit'
      end
    else
      @user.attributes = (params[:user])
      if @user.save(:validate => false)
        flash[:notice] = "Successfully updated User."
        redirect_to users_path
      else
        render :action => 'edit'
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to root_path
    end
  end

end
