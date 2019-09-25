# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Work, type: :model do
  describe 'table' do
    it { is_expected.to have_db_column(:metadata).of_type(:jsonb) }
    it { is_expected.to have_db_column(:depositor_id) }
    it { is_expected.to have_db_index(:depositor_id) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:depositor).class_name('User').with_foreign_key(:depositor_id) }
    it { is_expected.to have_many(:work_creations) }
    it { is_expected.to have_many(:aliases).through(:work_creations) }
    it { is_expected.to have_many(:work_versions) }
  end

  describe '#title' do
    subject { described_class.new(title: 'My title') }

    its(:title) { is_expected.to eq('My title') }
  end

  describe '#subtitle' do
    subject { described_class.new(subtitle: 'My subtitle') }

    its(:subtitle) { is_expected.to eq('My subtitle') }
  end

  describe '#keywords' do
    context 'without any keywords' do
      subject { described_class.new }

      its(:keywords) { is_expected.to be_empty }
    end

    context 'with keywords' do
      subject { described_class.new(keywords: ['keyword1', 'keyword2']) }

      its(:keywords) { is_expected.to contain_exactly('keyword1', 'keyword2') }
    end
  end
end
