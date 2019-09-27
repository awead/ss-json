# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'work_versions/edit', type: :view do
  before do
    @work_version = assign(:work_version, WorkVersion.create!)
  end

  it 'renders the edit work_version form' do
    render

    assert_select 'form[action=?][method=?]', work_version_path(@work_version), 'post' do
    end
  end
end
