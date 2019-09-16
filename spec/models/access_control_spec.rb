# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccessControl, type: :model do
  describe 'table' do
    it { is_expected.to have_db_column(:resource_type) }
    it { is_expected.to have_db_column(:resource_id) }
    it { is_expected.to have_db_column(:agent_type) }
    it { is_expected.to have_db_column(:agent_id) }
    it { is_expected.to have_db_column(:access_level) }
    it { is_expected.to have_db_index([:resource_type, :resource_id]) }
    it { is_expected.to have_db_index([:agent_type, :agent_id]) }
  end
end
