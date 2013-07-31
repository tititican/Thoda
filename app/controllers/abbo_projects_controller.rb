class AbboProjectsController < ApplicationController
  layout "project"
  def index
  	if params[:search].present? && !params[:search][:category_id].blank?
  		@projects = Project.where("category_id = ?", params[:search][:category_id])
  	else
  		@projects = Project.all
  	end
  @tags = Project.tag_counts.map(&:name).sort!
  end

  def show
  	@project = Project.find(params[:id])
    @picture = @project.pictures
  end
end
