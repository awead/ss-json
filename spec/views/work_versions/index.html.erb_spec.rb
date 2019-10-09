# frozen_string_literal: true

require 'rails_helper'

RSpec.xdescribe 'work_versions/index', type: :view do
  let(:work) do
    User.create.works.create(
      work_type: Work::Types.all.first,
      versions_attributes: [{ title: 'Sample Work' }]
    )
  end

  let(:mock_policy) { instance_double(WorkPolicy) }

  before do
    work.versions.create(title: 'Version 2')
    work.versions.create(title: 'Version 3')
    assign(:work, work)
    without_partial_double_verification do
      allow(view).to receive(:policy).and_return(mock_policy)
    end
  end

  context 'when the policy allows you to create new versions' do
    before { allow(mock_policy).to receive(:create_version?).and_return(true) }

    it 'renders the page with a link to create a new version' do
      render
      expect(rendered).to include('New Version')
    end
  end

  context 'when the work has a draft version' do
    before { allow(mock_policy).to receive(:create_version?).and_return(false) }

    it 'renders the page without a link to create a new version' do
      render
      expect(rendered).not_to include('New Version')
    end
  end
end
