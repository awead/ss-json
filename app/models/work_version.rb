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

  belongs_to :work
  has_many :version_memberships, dependent: :destroy
  has_many :file_resources, through: :version_memberships

  def valid_for_publication?
    true
  end
end
