class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.build(note_id: params[:note_id])
    favorite.save
    redirect_to notes_path
  end

  def destroy
    favorite = Favorite.find_by(note_id: params[:note_id], user_id: current_user.id)
    favorite.destroy
    redirect_to notes_path
  end
end
