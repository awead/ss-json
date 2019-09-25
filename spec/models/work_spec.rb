# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Work, type: :model do
  describe 'table' do
    it { is_expected.to have_db_column(:metadata).of_type(:jsonb) }
    it { is_expected.to have_db_column(:depositor_id) }
    it { is_expected.to have_db_index(:depositor_id) }
    it { is_expected.to have_jsonb_accessor(:title).of_type(:string) }
    it { is_expected.to have_jsonb_accessor(:subtitle).of_type(:string) }
    it { is_expected.to have_jsonb_accessor(:keywords).of_type(:string).is_array.with_default([]) }
    it { is_expected.to have_jsonb_accessor(:rights).of_type(:string) }
    it { is_expected.to have_jsonb_accessor(:description).of_type(:string) }
    it { is_expected.to have_jsonb_accessor(:resource_type).of_type(:string) }
    it { is_expected.to have_jsonb_accessor(:contributor).of_type(:string) }
    it { is_expected.to have_jsonb_accessor(:publisher).of_type(:string) }
    it { is_expected.to have_jsonb_accessor(:published_date).of_type(:string) }
    it { is_expected.to have_jsonb_accessor(:subject).of_type(:string) }
    it { is_expected.to have_jsonb_accessor(:language).of_type(:string) }
    it { is_expected.to have_jsonb_accessor(:identifier).of_type(:string) }
    it { is_expected.to have_jsonb_accessor(:based_near).of_type(:string) }
    it { is_expected.to have_jsonb_accessor(:related_url).of_type(:string) }
    it { is_expected.to have_jsonb_accessor(:source).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:depositor).class_name('User').with_foreign_key(:depositor_id) }
    it { is_expected.to have_many(:work_creations) }
    it { is_expected.to have_many(:aliases).through(:work_creations) }
    it { is_expected.to have_many(:work_versions) }
  end
end
