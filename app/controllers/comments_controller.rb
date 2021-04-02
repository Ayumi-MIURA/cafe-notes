class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to note_path(params[:note_id]) }
        format.json
      end
    else
      @note = @comment.note
      @comments = @note.comments
      render :"notes/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, note_id: params[:note_id])
  end
end
