# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'table' do
    it { is_expected.to have_db_column(:name) }
  end
end
