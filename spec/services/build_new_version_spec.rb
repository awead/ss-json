# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BuildNewVersion, type: :model do
  let!(:user) { User.create }
  let!(:work) { user.works.create }
  let!(:previous_version) { work.versions.create(title: 'My Happy Version', aasm_state: 'published') }
  let!(:file_path) { Pathname.new(fixture_path).join('image.png') }

  before do
    previous_version.file_resources.create(file: File.open(file_path))
  end

  describe '.call' do
    subject(:new_version) { described_class.call(previous_version) }

    it { is_expected.to be_a WorkVersion }
    it { is_expected.not_to be_persisted }
    its(:aasm_state) { is_expected.to eq 'draft' }
    its(:title) { is_expected.to eq 'My Happy Version' }
    its(:work) { is_expected.to eq work }

    it 'retains the same file resources' do
      expect(new_version.file_resources.length).to eq 1
      new_version.file_resources.first.tap do |file_resource|
        expect(file_resource).to be_persisted
        expect(file_resource.id).to eq previous_version.file_resources.first.id
      end
    end

    it "doesn't change the database" do
      expect { new_version }.not_to change(WorkVersion, :count)
      expect { new_version }.not_to change(FileResource, :count)
    end
  end
end
