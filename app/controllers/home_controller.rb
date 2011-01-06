class HomeController < ApplicationController
  def index
    # if the user is signed in send them to the main inspirovations page
    if user_signed_in?
      redirect_to :controller => "ideas"
    end
  end
  
  def coming_soon
    respond_to do |format|
      format.html # coming_soon.html.erb
    end
  end
end