# frozen_string_literal: true

class WorkVersionsController < ApplicationController
  before_action :set_work_version, only: [:show, :edit, :update, :destroy]
  before_action :set_work

  # GET /work_versions
  # GET /work_versions.json
  def index; end

  # GET /work_versions/1
  # GET /work_versions/1.json
  def show; end

  # GET /work_versions/new
  def new
    @work_version = @work.work_versions.build(metadata: @work.work_versions.last.metadata)
  end

  # GET /work_versions/1/edit
  def edit; end

  # POST /work_versions
  # POST /work_versions.json
  def create
    @work_version = @work.work_versions.build(work_version_params)

    respond_to do |format|
      if @work_version.save
        format.html do
          redirect_to work_version_path(@work, @work_version), notice: 'Work version was successfully created.'
        end
        format.json { render :show, status: :created, location: @work_version }
      else
        format.html { render :new }
        format.json { render json: @work_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_versions/1
  # PATCH/PUT /work_versions/1.json
  def update
    respond_to do |format|
      if @work_version.update(work_version_params)
        format.html do
          redirect_to work_version_path(@work, @work_version), notice: 'Work version was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @work_version }
      else
        format.html { render :edit }
        format.json { render json: @work_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_versions/1
  # DELETE /work_versions/1.json
  def destroy
    @work_version.destroy
    respond_to do |format|
      format.html { redirect_to work_versions_url, notice: 'Work version was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_work_version
      @work_version = WorkVersion.find(params[:id])
    end

    def set_work
      @work = Work.find(params[:work_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_version_params
      params
        .require(:work_version)
        .permit(
          :title,
          :subtitle,
          { keywords: [] },
          :rights,
          :description,
          :resource_type,
          :contributor,
          :publisher,
          :published_date,
          :subject,
          :language,
          :identifier,
          :based_near,
          :related_url,
          :source
        )
    end
end
