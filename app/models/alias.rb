# frozen_string_literal: true

class Alias < ApplicationRecord
  has_many :work_creations, dependent: :restrict_with_exception
  belongs_to :creator
  has_many :works, through: :work_creations
end
