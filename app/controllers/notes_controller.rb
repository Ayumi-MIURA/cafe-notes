class NotesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destory]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :constraint_user, only: [:edit, :update, :destroy]

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @note.comments.includes(:user)
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to note_path(@note)
    else
      render :edit
    end
  end

  def destroy
    if @note.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @notes = Note.search(params[:keyword])
  end

  private

  def note_params
    params.require(:note).permit(
      :cafe_name,
      :appearance,
      :aroma,
      :taste,
      :rich,
      :geography_id,
      :processing_id,
      :tasting_note,
      :image
    ).merge(user_id: current_user.id)
  end

  def set_item
    @note = Note.find(params[:id])
  end

  def constraint_user
    redirect_to new_user_session_path unless user_signed_in? && current_user.id == @note.user_id
  end
end
