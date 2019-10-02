# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FileVersionMembershipsController, type: :routing do
  describe 'routing' do
    # This creates and edits files at the same time
    it 'routes to #update via PUT' do
      expect(put: '/works/1/versions/1/files/1').to route_to(
        controller: 'file_version_memberships',
        action: 'update',
        work_id: '1',
        version_id: '1',
        id: '1'
      )
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/works/1/versions/1/files/1').to route_to(
        controller: 'file_version_memberships',
        action: 'update',
        work_id: '1',
        version_id: '1',
        id: '1'
      )
    end

    it 'routes to #destroy' do
      expect(delete: '/works/1/versions/1/files/1').to route_to(
        controller: 'file_version_memberships',
        action: 'destroy',
        work_id: '1',
        version_id: '1',
        id: '1'
      )
    end
  end
end
