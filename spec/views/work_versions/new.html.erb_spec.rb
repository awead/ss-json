# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'work_versions/new', type: :view do
  let(:work) do
    User.create.works.create(
      work_type: Work::Types.all.first,
      versions_attributes: [{ title: 'Sample Work' }]
    )
  end

  before do
    @work = assign(:work, work)
    assign(:work_version, @work.versions.build)
  end

  it 'renders new work_version form' do
    render

    assert_select 'form[action=?][method=?]', work_versions_path(@work), 'post' do
    end
  end
end
