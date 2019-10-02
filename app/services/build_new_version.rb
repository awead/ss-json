# frozen_string_literal: true

class BuildNewVersion
  def self.call(previous_version)
    parent_work = previous_version.work

    new_version = parent_work.versions.build(
      metadata: previous_version.metadata,
      aasm_state: 'draft'
    )

    previous_version.file_version_memberships.each do |previous_membership|
      new_version.file_version_memberships.build(
        file_resource_id: previous_membership.file_resource_id,
        title: previous_membership.title
      )
    end

    new_version
  end
end
