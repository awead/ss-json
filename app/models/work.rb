# frozen_string_literal: true

class Work < ApplicationRecord
  jsonb_accessor :metadata,
                 title: :string,
                 subtitle: :string,
                 keywords: [:string, array: true, default: []],
                 rights: :string,
                 description: :string,
                 resource_type: :string,
                 contributor: :string,
                 publisher: :string,
                 published_date: :string,
                 subject: :string,
                 language: :string,
                 identifier: :string,
                 based_near: :string,
                 related_url: :string,
                 source: :string

  [:keywords].each do |array_field|
    define_method "#{array_field}=" do |vals|
      super(strip_blanks_from_array(vals))
    end
  end

  belongs_to :depositor, class_name: 'User', foreign_key: 'depositor_id', inverse_of: 'works'
  has_many :work_creations, dependent: :restrict_with_exception
  has_many :aliases, through: :work_creations
  has_many :access_controls, as: :resource, dependent: :destroy
  has_many :work_versions, dependent: :destroy

  private

    def strip_blanks_from_array(arr)
      Array.wrap(arr).reject(&:blank?)
    end
end
