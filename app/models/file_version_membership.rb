# frozen_string_literal: true

class FileVersionMembership < ApplicationRecord
  belongs_to :work_version
  belongs_to :file_resource

  delegate :size, :mime_type, :original_filename, to: :uploader

  def title
    read_attribute(:title).presence || original_filename
  end

  private

    def uploader
      @uploader ||= file_resource&.file
    end
end
