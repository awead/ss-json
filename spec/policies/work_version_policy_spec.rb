# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WorkVersionPolicy, type: :policy do
  subject { described_class }

  let(:user) { User.new }
  let(:work_version) { instance_double(WorkVersion) }

  permissions '.scope' do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :edit?, :update? do
    context 'when work version is draft' do
      before { allow(work_version).to receive(:draft?).and_return(true) }

      it { is_expected.to permit(user, work_version) }
    end

    context 'when work version is published' do
      before { allow(work_version).to receive(:draft?).and_return(false) }

      it { is_expected.not_to permit(user, work_version) }
    end
  end
end
