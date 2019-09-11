# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Alias, type: :model do
  describe 'table' do
    it { is_expected.to have_db_column(:display_name).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:work_creations) }
    it { is_expected.to have_many(:works).through(:work_creations) }
    it { is_expected.to belong_to(:creator) }
  end
end
