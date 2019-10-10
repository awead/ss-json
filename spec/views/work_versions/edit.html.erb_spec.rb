# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'work_versions/edit', type: :view do
  let(:work) do
    User.create.works.create(
      work_type: Work::Types.all.first,
      versions_attributes: [{ title: 'Sample Work' }]
    )
  end

  before do
    @work = assign(:work, work)
    @work_version = assign(:work_version, @work.versions.first)
  end

  it 'renders the edit work_version form' do
    render

    assert_select 'form[action=?][method=?]', work_version_path(@work, @work_version), 'post' do
    end
  end
end
