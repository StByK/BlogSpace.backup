class PostsController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page], per_page: 9).order("id DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: "投稿が完了しました"
    end
  end

  def show
    @post = Post.find(params[:id])
    @author = User.find(@post.user_id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user.id)
  end

end
