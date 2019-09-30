# frozen_string_literal: true

class FileVersionMembership < ApplicationRecord
  belongs_to :work_version
  belongs_to :file_resource
end
