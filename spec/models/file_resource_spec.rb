# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FileResource, type: :model do
  describe 'table' do
    it { is_expected.to have_db_column(:file_data).of_type(:jsonb) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:file_version_memberships) }
    it { is_expected.to have_many(:work_versions).through(:file_version_memberships) }
  end
end
