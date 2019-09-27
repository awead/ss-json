# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WorkVersionsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/works/1/versions').to route_to(
        controller: 'work_versions', action: 'index', work_id: '1'
      )
    end

    it 'routes to #new' do
      expect(get: '/works/1/versions/new').to route_to(
        controller: 'work_versions', action: 'new', work_id: '1'
      )
    end

    it 'routes to #show' do
      expect(get: '/works/1/versions/1').to route_to(
        controller: 'work_versions', action: 'show', work_id: '1', id: '1'
      )
    end

    it 'routes to #edit' do
      expect(get: '/works/1/versions/1/edit').to route_to(
        controller: 'work_versions', action: 'edit', work_id: '1', id: '1'
      )
    end

    it 'routes to #create' do
      expect(post: '/works/1/versions').to route_to(
        controller: 'work_versions', action: 'create', work_id: '1'
      )
    end

    it 'routes to #update via PUT' do
      expect(put: '/works/1/versions/1').to route_to(
        controller: 'work_versions', action: 'update', work_id: '1', id: '1'
      )
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/works/1/versions/1').to route_to(
        controller: 'work_versions', action: 'update', work_id: '1', id: '1'
      )
    end

    it 'routes to #destroy' do
      expect(delete: '/works/1/versions/1').to route_to(
        controller: 'work_versions', action: 'destroy', work_id: '1', id: '1'
      )
    end
  end
end
