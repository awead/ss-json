# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'work_versions/show', type: :view do
  before do
    @work_version = assign(:work_version, WorkVersion.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
