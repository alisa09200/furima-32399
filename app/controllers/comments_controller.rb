class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      # binding.pry
      ActionCable.server.broadcast 'comment_channel', {content: @comment, user: @comment.user}
    end
    redirect_to item_path(params[:item_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
    #params.require(:comment, :user).permit(:text, :nickname).merge(user_id: current_user.id, item_id: params[:item_id])
    #params.require(:user).permit(:nickname)
  end


  #def new
    #@comments = Comment.all
    #@comment = Comment.new
  #end

  #def create
    #@comment = Comment.new(text: params[:comment][:text])
    #if @comment.save
      #ActionCable.server.broadcast 'comment_channel', content: @comment
    #end
  #end
end
