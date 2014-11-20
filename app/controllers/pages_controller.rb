class PagesController < ApplicationController
  def index
  	@projects = Project.all
  	@users = User.all
  	
  end

  def about
  end
end
