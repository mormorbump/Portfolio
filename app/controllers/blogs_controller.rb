class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]



  def index
    @blogs = Blog.paginate(page: params[:page], per_page: 6)
    @title = "コラム"
  end


  def show

    @gyms = Gym.all
    @gym = Blog.find(params[:id])
      @blogs = Blog.all
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: '投稿しました' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: '更新しました' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: '削除しました' }
      format.json { head :no_content }
    end
  end

  private

    def set_blog
      @blog = Blog.find(params[:id])
    end


    def blog_params
      params.require(:blog).permit(:title, :body)
    end
end
