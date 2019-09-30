# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'work_versions/edit', type: :view do
  before do
    @work = assign(:work, User.create.works.create)
    @work_version = assign(:work_version, @work.versions.create)
  end

  it 'renders the edit work_version form' do
    render

    assert_select 'form[action=?][method=?]', work_version_path(@work, @work_version), 'post' do
    end
  end
end
