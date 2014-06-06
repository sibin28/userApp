class PostsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.create(params[:post])
    if @post.save
      redirect_to blog_path(@blog), :notice=>"Post was created successfully"
    else			
        #render :text =>"<pre>"+ "tst".to_yaml and return
       	render "new"
    end     
  end
  
  def new
    @post = Post.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  def edit
     @blog = Blog.find(params[:blog_id])
     @post =@blog.posts.find(params[:id])
  end

  def destroy
    #render :text =>"<pre>"+ params[:blog_id].to_yaml and return
    @blog = Blog.find(params[:blog_id])
    @post = Post.find(params[:id])
    @post.destroy
      respond_to do |format|
      format.html { redirect_to blog_path(@blog) }
      format.json { head :no_content }
    end
  end

  def update 
    #render :text =>"<pre>"+ "comm".to_yaml and return
    @blog = Blog.find(params[:blog_id])
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to blog_path(@blog), notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

end
