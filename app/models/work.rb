# frozen_string_literal: true

class Work < ApplicationRecord
  belongs_to :depositor, class_name: 'User', foreign_key: 'depositor_id', inverse_of: 'works'
  has_many :work_creations, dependent: :restrict_with_exception
  has_many :aliases, through: :work_creations
  has_many :access_controls, as: :resource, dependent: :destroy
  has_many :work_versions, dependent: :destroy

  accepts_nested_attributes_for :work_versions

  after_initialize :set_defaults

  private

    def set_defaults
      work_versions.build if work_versions.empty?
    end
end
