class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:notice] = "New comment has been created"
    else
      flash[:error] = "There was a problem when commenting"
    end
    redirect_to @comment.topic
  end

  def update

  end
end
