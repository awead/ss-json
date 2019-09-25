# frozen_string_literal: true

class VersionMembership < ApplicationRecord
  belongs_to :work_version
  belongs_to :file_resource
end
