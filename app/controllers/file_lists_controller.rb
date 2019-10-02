# frozen_string_literal: true

class FileListsController < ApplicationController
  before_action :load_work_version

  def edit; end

  def update
    if @work_version.update(work_version_params)
      redirect_to work_version_file_list_path
    else
      render :edit
    end
  end

  private

    def load_work_version
      @work_version = WorkVersion.find(params[:version_id])
    end

    def work_version_params
      params
        .require(:work_version)
        .permit(
          file_resources_attributes: [
            :file
          ]
        )
    end
end
