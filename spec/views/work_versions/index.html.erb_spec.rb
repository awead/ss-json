# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'work_versions/index', type: :view do
  let(:work) { User.create.works.create }

  before do
    work.versions.create
    work.versions.create
    assign(:work, work)
  end

  it 'renders a list of work_versions' do
    render
  end
end
