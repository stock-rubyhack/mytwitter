# The controller for "Pages" which containing all of the code for any item inside of /pages
class PagesController < ApplicationController
  # back-end code for pages/index
  def index
  end

  # back-end code for pages/home
  def home
  end

  # back-end code for pages/profile
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

  end

  # back-end code for pages/explore
  def explore
  end
end
