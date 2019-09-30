# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FileListsController, type: :routing do
  describe 'routing' do
    # This renders a form that lists existing files as well as form for adding new ones
    it 'routes to #edit' do
      expect(get: '/works/1/versions/1/file_list').to route_to(
        controller: 'file_lists', action: 'edit', work_id: '1', version_id: '1'
      )
    end

    # This creates and edits files at the same time
    it 'routes to #update via PUT' do
      expect(put: '/works/1/versions/1/file_list').to route_to(
        controller: 'file_lists', action: 'update', work_id: '1', version_id: '1'
      )
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/works/1/versions/1/file_list').to route_to(
        controller: 'file_lists', action: 'update', work_id: '1', version_id: '1'
      )
    end
  end
end
