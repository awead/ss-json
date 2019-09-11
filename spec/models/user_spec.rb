# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'table' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:access_id).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:works) }
  end
end
