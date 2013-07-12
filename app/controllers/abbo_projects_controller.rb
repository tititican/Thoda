class AbboProjectsController < ApplicationController
  layout "project"
  def index
  	@projects = Project.all
    @tags = Project.tag_counts.map(&:name)
  end

  def show
  	@project = Project.find(params[:id])
    @picture = @project.pictures
  end
end
