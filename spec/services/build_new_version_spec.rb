# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BuildNewVersion, type: :model do
  let!(:user) { User.create }
  let!(:work) { user.works.create }
  let!(:previous_version) { work.versions.create(title: 'My Happy Version', aasm_state: 'published') }
  let!(:file_resource) { FileResource.create!(file: File.open(file_path)) }
  let!(:file_path) { Pathname.new(fixture_path).join('image.png') }

  before do
    previous_version.file_version_memberships.create!(
      file_resource: file_resource,
      title: 'overridden-title.png'
    )
  end

  describe '.call' do
    subject(:new_version) { described_class.call(previous_version) }

    it { is_expected.to be_a WorkVersion }
    it { is_expected.not_to be_persisted }
    its(:aasm_state) { is_expected.to eq 'draft' }
    its(:title) { is_expected.to eq 'My Happy Version' }
    its(:work) { is_expected.to eq work }

    it 'retains the same file resources' do
      expect(new_version.file_version_memberships.length).to eq 1

      new_version.file_version_memberships.first.tap do |membership|
        expect(membership.title).to eq 'overridden-title.png'
        expect(membership.file_resource).to eq file_resource
      end
    end

    it "doesn't change the database" do
      expect { new_version }.not_to change(WorkVersion, :count)
      expect { new_version }.not_to change(FileResource, :count)
    end

    context 'when persisting the new version' do
      it 'returns a WorkVersion that persists as expected' do
        expect {
          new_version.save!
        }.to change(WorkVersion, :count).by(1)
          .and change(FileVersionMembership, :count).by(1)
          .and change(FileResource, :count).by(0)

        new_version.reload
        expect(new_version.file_resources).to match_array [file_resource]
      end
    end
  end
end
