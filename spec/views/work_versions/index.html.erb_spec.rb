# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'work_versions/index', type: :view do
  let(:work) do
    User.create.works.create(
      work_type: Work::Types.all.first,
      versions_attributes: [{ title: 'Sample Work' }]
    )
  end

  before do
    work.versions.create(title: 'Version 2')
    work.versions.create(title: 'Version 3')
    assign(:work, work)
  end

  it 'renders a list of work_versions' do
    render
  end
end
