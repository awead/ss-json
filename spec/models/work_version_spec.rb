# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WorkVersion, type: :model do
  describe 'table' do
    it { is_expected.to have_db_column(:work_id) }
    it { is_expected.to have_db_column(:version_name) }
    it { is_expected.to have_db_index(:work_id) }
    it { is_expected.to have_db_column(:aasm_state) }
    it { is_expected.to have_db_column(:metadata).of_type(:jsonb) }
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
    it { is_expected.to belong_to(:work) }
    it { is_expected.to have_many(:version_memberships) }
    it { is_expected.to have_many(:file_resources).through(:version_memberships) }
  end

  describe 'states' do
    it { is_expected.to have_state(:draft) }
    it { is_expected.to transition_from(:draft).to(:published).on_event(:publish) }
    it { is_expected.to transition_from(:published).to(:withdrawn).on_event(:withdraw) }
    it { is_expected.to transition_from(:withdrawn).to(:published).on_event(:publish) }
    it { is_expected.to transition_from(:draft).to(:removed).on_event(:remove) }
    it { is_expected.to transition_from(:withdrawn).to(:removed).on_event(:remove) }
  end

  describe 'keywords=' do
    subject { described_class.new(keywords: ['', 'thing']) }

    its(:keywords) { is_expected.to contain_exactly('thing') }
  end
end