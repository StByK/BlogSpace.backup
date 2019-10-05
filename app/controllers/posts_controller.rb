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
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params) if post.user_id == current_user.id
    redirect_to "/posts/#{params[:id]}"
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy(post_params) if post.user_id == current_user.id
  end

  private

  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user.id)
  end

end
