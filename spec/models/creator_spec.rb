# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Creator, type: :model do
  describe 'table' do
    it { is_expected.to have_db_column(:surname).of_type(:string) }
    it { is_expected.to have_db_column(:given_name).of_type(:string) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:psu_id).of_type(:string) }
    it { is_expected.to have_db_column(:orcid).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:aliases) }
  end
end
