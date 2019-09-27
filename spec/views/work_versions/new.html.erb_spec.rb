# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'work_versions/new', type: :view do
  before do
    assign(:work_version, WorkVersion.new)
  end

  it 'renders new work_version form' do
    render

    assert_select 'form[action=?][method=?]', work_versions_path, 'post' do
    end
  end
end
