class StaticPagesController < ApplicationController
  def home
    @message = Message.new
    @projects = Project.limit(8)
  end

  def about
  end

  def development
  end

  def design
  end

  def management
  end
end
