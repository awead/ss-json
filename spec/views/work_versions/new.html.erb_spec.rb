# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'work_versions/new', type: :view do
  before do
    @work = assign(:work, User.create.works.create)
    assign(:work_version, @work.versions.build)
  end

  it 'renders new work_version form' do
    render

    assert_select 'form[action=?][method=?]', work_versions_path(@work), 'post' do
    end
  end
end
