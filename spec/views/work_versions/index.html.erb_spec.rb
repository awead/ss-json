# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'work_versions/index', type: :view do
  before do
    assign(:work_versions, [
             WorkVersion.create!,
             WorkVersion.create!
           ])
  end

  it 'renders a list of work_versions' do
    render
  end
end
