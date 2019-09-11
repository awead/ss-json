# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Work, type: :model do
  describe 'table' do
    it { is_expected.to have_db_column(:metadata).of_type(:jsonb) }
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
