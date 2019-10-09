# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'work_versions/show', type: :view do
  let(:work) do
    User.create.works.create(
      work_type: Work::Types.all.first,
      versions_attributes: [{ title: 'Sample Work' }]
    )
  end

  let(:mock_policy) { instance_spy('WorkVersionPolicy') }

  before do
    @work = assign(:work, work)
    @work_version = assign(:work_version, @work.versions.first)
    without_partial_double_verification do
      allow(view).to receive(:policy).and_return(mock_policy)
    end
  end

  it 'renders attributes in <p>' do
    render
  end
end
