# frozen_string_literal: true

class Work < ApplicationRecord
  jsonb_accessor :metadata,
                 title: :string,
                 subtitle: :string,
                 keywords: [:string, array: true, default: []]
  belongs_to :depositor, class_name: 'User', foreign_key: 'depositor_id', inverse_of: 'works'
end
