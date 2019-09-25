# frozen_string_literal: true

class WorkVersion < ApplicationRecord
  belongs_to :work
  has_many :version_memberships, dependent: :destroy
  has_many :file_resources, through: :version_memberships
end
