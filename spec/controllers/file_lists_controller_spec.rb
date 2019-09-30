# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FileListsController, type: :controller do
  let(:valid_session) { {} }
  let(:work_version) { User.create.works.create.versions.create }

  describe '#edit' do
    it 'returns a success response' do
      get :edit, params: { work_id: work_version.work.id, version_id: work_version.id }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe '#update' do
    it 'redirects somewhere' do
    end
  end
end
