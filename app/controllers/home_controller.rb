class HomeController < ApplicationController
  def index
    # if the user is signed in send them to the main inspirovations page
    if user_signed_in?
      redirect_to :controller => "ideas"
    end
  end
end