class PicturesController < ApplicationController
  # GET /pictures
  # GET /pictures.json
  def index
    @project = Project.find(params[:project_id])
    @pictures = @project.pictures

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pictures.collect { |p| p.to_jq_upload }.to_json }

    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = Picture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @project = Project.find(params[:project_id])
    @picture = @project.pictures.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @picture = @project.pictures.find(params[:id])
    # @picture = Picture.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.json
  # def create
  #   @project = Project.find(params[:project_id])
  #   @picture = @project.pictures.create(params[:picture])

  #   respond_to do |format|
  #     if @picture.save
  #       format.html { redirect_to project_path(@project), notice: 'Picture was successfully created.' }
  #       format.json { render json: [@picture.to_jq_upload].to_json, status: :created, location: @picture }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @picture.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    p_attr = params[:picture]
    p_attr[:image] = params[:picture][:image].first if params[:picture][:image].class == Array

    
      @project = Project.find(params[:project_id])
      @picture = @project.pictures.build(p_attr)

    if @picture.save
      respond_to do |format|
        format.html {
          render :json => [@picture.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@picture.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update
    @picture = Picture.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(params[:picture])
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    render :json => true
  end
end
