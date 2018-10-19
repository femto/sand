class HomeController < ApplicationController
  def index
    redirect_to "/users"
  end
end
