class StaticPagesController < ApplicationController
  before_filter :random_projects, except: :home 
  
  def home
    @message = Message.new
    @projects = Project.featured.limit(8)
  end

  def about
  end

  def development
  end

  def design
  end

  def management
  end

private
  def random_projects
    @random_projects = Project.random(4)
  end

end
