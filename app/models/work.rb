# frozen_string_literal: true

class Work < ApplicationRecord
  jsonb_accessor :metadata,
                 title: :string,
                 subtitle: :string,
                 keywords: [:string, array: true, default: []]
end
