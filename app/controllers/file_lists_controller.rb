# frozen_string_literal: true

class FileListsController < ApplicationController
  before_action :load_work_version

  def edit; end

  def update; end

  private

    def load_work_version
      @work_version = WorkVersion.find(params[:version_id])
    end
end
