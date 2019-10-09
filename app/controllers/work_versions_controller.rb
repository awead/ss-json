# frozen_string_literal: true

class WorkVersionsController < ApplicationController
  before_action :set_work_version, only: [:show, :edit, :update, :destroy]
  before_action :set_work

  def index; end

  def show; end

  def edit; end

  def publish
    @work_version = WorkVersion.find(params[:version_id])
  end

  def create
    # @todo scope to return latest published version
    # Additional logic: validate does a draft version currently exist?
    @work_version = BuildNewVersion.call(@work.versions.last)

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

  def update
    respond_to do |format|
      @work_version.attributes = work_version_params
      @work_version.publish if publish?
      if @work_version.save
        format.html do
          if publish?
            redirect_to work_path(@work), notice: 'Successfully published work!! Yey!'
          else
            redirect_to work_version_publish_path(@work, @work_version),
                        notice: 'Work version was successfully updated.'
          end
        end
        format.json { render :show, status: :ok, location: @work_version }
      else
        format.html do
          if publish?
            render :publish
          else
            render :edit
          end
        end
        format.json { render json: @work_version.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @work_version.destroy
    respond_to do |format|
      format.html { redirect_to versions_url, notice: 'Work version was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_work_version
      @work_version = WorkVersion.find(params[:id])
    end

    def set_work
      @work = Work.find(params[:work_id])
    end

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
          :source,
          :depositor_agreement,
          :version_name
        )
    end

    def publish?
      params.key?(:publish)
    end
end
