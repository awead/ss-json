# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WorkVersion, type: :model do
  describe 'table' do
    it { is_expected.to have_db_column(:work_id) }
    it { is_expected.to have_db_column(:title) }
    it { is_expected.to have_db_index(:work_id) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:work) }
    it { is_expected.to have_many(:version_memberships) }
    it { is_expected.to have_many(:file_resources).through(:version_memberships) }
  end
end
