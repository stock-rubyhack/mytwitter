# The controller for "Pages" which containing all of the code for any item inside of /pages
class PagesController < ApplicationController
  # back-end code for pages/index
  def index
  end

  # back-end code for pages/home
  def home
    @posts = Post.all
  end

  # back-end code for pages/profile
  # we only want to see own post in our own profile
  def profile
    # grab the username from the url as :id  (shouldn't we use strong param here too to prevent cmd injection????)
    # below steps basically put application to route orrectly based on username. Note the http://x.x.x.x/user/username will be the id.. no db look up at this stage
    #@username = params[:id]
    #below is the same logic but adding user check from db.
    if (User.find_by_username(params[:id]))
      @username = params[:id]
    else
      #redirect to 404 page (using root for now instead)
      redirect_to root_path, :notice=> "User Not Found!!!"
    end
    @posts = Post.all.where("user_id= ?", User.find_by_username(params[:id]).id )
    @newPost = Post.new
  end

  # back-end code for pages/explore
  # we want to see all post.
  def explore
    @posts = Post.all
  end
end
