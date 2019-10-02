# frozen_string_literal: true

class FileVersionMembership < ApplicationRecord
  belongs_to :work_version
  belongs_to :file_resource

  before_validation :initialize_title, on: :create

  validates :title,
            presence: true,
            uniqueness: {
              scope: :work_version_id
            }

  delegate :size, :mime_type, :original_filename, to: :uploader

  private

    def uploader
      @uploader ||= file_resource&.file
    end

    def initialize_title
      self.title ||= uploader&.original_filename
    end
end
