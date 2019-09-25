# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FileResource, type: :model do
  describe 'table' do
    it { is_expected.to have_db_column(:file_data).of_type(:jsonb) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:version_memberships) }
    it { is_expected.to have_many(:work_versions).through(:version_memberships) }
  end
end
