# frozen_string_literal: true

class FileVersionMembershipsController < ApplicationController
  before_action :load_file_resource

  def edit; end

  def update
    if @file_version.update(file_version_params)
      respond_to do |format|
        format.html { redirect_to work_version_file_list_path, notice: 'File was successfully updated.' }
        format.json { render json: @file_version }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @file_version.errors, status: :unprocessable_entity }
      end
    end
  end

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

    def file_version_params
      params
        .require(:file_version_membership)
        .permit(:title)
    end
end
