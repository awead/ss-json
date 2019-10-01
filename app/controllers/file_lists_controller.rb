# frozen_string_literal: true

class FileListsController < ApplicationController
  before_action :load_work_version

  def edit; end

  def update
    redirect_to work_version_file_list_path
  end

  private

    def load_work_version
      @work_version = WorkVersion.find(params[:version_id])
    end
end
