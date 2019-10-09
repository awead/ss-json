# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WorkPolicy, type: :policy do
  subject(:policy) { described_class }

  let(:user) { User.create }

  permissions :create_version? do
    let(:work) do
      user.works.create(work_type: Work::Types.all.first, versions_attributes: [{ title: 'My Happy Version' }])
    end

    let(:version) { work.versions.first }

    context 'when a draft exists' do
      before { version.reload.update_column(:aasm_state, WorkVersion::STATE_DRAFT) }

      it { is_expected.not_to permit(user, work) }
    end

    context 'when no draft exists' do
      before { version.reload.update_column(:aasm_state, WorkVersion::STATE_PUBLISHED) }

      it { is_expected.to permit(user, work) }
    end
  end
end
