# frozen_string_literal: true

class WorkPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create_version?
    record.draft_version.blank?
  end
end
