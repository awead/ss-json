# frozen_string_literal: true

class FileVersionMembership < ApplicationRecord
  belongs_to :work_version
  belongs_to :file_resource

  def title
    read_attribute(:title).presence || file_resource&.file&.original_filename
  end
end
