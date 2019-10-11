# frozen_string_literal: true

class WorkVersionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    record.draft?
  end

  alias_method :update?, :edit?
end
