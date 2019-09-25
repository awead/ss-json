# frozen_string_literal: true

class FileResource < ApplicationRecord
  has_many :version_memberships, dependent: :destroy
  has_many :work_versions, through: :version_memberships
end
