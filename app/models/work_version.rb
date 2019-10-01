# frozen_string_literal: true

class WorkVersion < ApplicationRecord
  include AASM

  aasm do
    state :draft, intial: true
    state :published, :withdrawn, :removed

    event :publish do
      before do
        # whatever we need to do...
      end
      transitions from: [:draft, :withdrawn], to: :published, guard: :valid_for_publication?
    end

    event :withdraw do
      transitions from: :published, to: :withdrawn
    end

    event :remove do
      transitions from: [:draft, :withdrawn], to: :removed
    end
  end

  belongs_to :work, inverse_of: :versions
  has_many :file_version_memberships, dependent: :destroy
  has_many :file_resources, through: :file_version_memberships
  accepts_nested_attributes_for :file_resources

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

  def valid_for_publication?
    true
  end

  private

    def strip_blanks_from_array(arr)
      Array.wrap(arr).reject(&:blank?)
    end
end
