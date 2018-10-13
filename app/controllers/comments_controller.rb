class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new

    @comment.topic = Topic.find(params[:comment][:topic_id].to_i)
    @comment.comment = params[:comment][:comment]

    #logger.debug @comment.comment
    if !@comment.comment.empty?
      @comment.save
      redirect_to topics_path, success: 'コメントしました'
    else
      flash[:danger] = 'コメントを入力してください'
      redirect_to topics_path
    end
  end

end
