
class CommentsController < ApplicationController

def create
	  #Testing comments controller
 	  @blog = Blog.find(params[:blog_id])
	  @post =Post.find(params[:post_id])
	  @comment =@post.comments.create(params[:comment])
	  if @comment.save  
	    redirect_to blog_path(@blog), :notice=>"Comment was created successfully"
	  else
		render "new"
	  end
end

def new
 	@comment = Comment.new
    	respond_to do |format|
      		format.html # new.html.erb
      		format.json { render json: @blog }
     	end
end

def destroy
	@blog = Blog.find(params[:blog_id])
	@comment = Comment.find(params[:id])
	@comment.destroy
    	respond_to do |format|
    	format.html { redirect_to blog_path(@blog) }
    	format.json { head :no_content }
 	end
end

def edit
	#render :text =>"<pre>"+ params[:id].to_yaml and return
	@blog = Blog.find(params[:blog_id])
    @post =@blog.posts.find(params[:post_id])
    # render :text =>"<pre>"+ params[:id].to_yaml and return
	@comment = @post.comments.find(params[:id])
	#render "edit"
end

def update 
	#render :text =>"<pre>"+ "comm".to_yaml and return
	@blog = Blog.find(params[:blog_id])
	@comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to blog_path(@blog), notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
end

end


