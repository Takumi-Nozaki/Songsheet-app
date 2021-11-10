class UsersController < ApplicationController
  def sign_up
  end

  def show
    @user = User.find(params[:id])
  end
  
end
