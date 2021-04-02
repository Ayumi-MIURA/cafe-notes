class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @favorite_notes = @user.favorite_notes
  end
end
