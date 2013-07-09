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

  def project
    @projects = Project.all
    @tags = Project.tag_counts.map(&:name)
  end
end
