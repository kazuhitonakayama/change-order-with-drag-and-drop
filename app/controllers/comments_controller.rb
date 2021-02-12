class CommentsController < ApplicationController
  def index
    @comments = Post.find(params[:post_id]).comments
    @post = Post.find(params[:post_id])
  end

  def new
    @comment = Comment.new
    @post = Post.find_by(id: params[:post_id])
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
        redirect_to :root
    else
        render action: :new
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content,:post_id,:position)
    end
end
