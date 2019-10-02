# frozen_string_literal: true

class FileVersionMembershipsController < ApplicationController
  before_action :load_file_resource

  def destroy
    @file_version.destroy
    respond_to do |format|
      format.html { redirect_to work_version_file_list_path, notice: 'Work version was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def load_file_resource
      @file_version = FileVersionMembership.find(params[:id])
    end
end
