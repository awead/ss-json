# frozen_string_literal: true

class BuildNewVersion
  def self.call(previous_version)
    parent_work = previous_version.work
    new_version = parent_work.versions.build(
      metadata: previous_version.metadata,
      aasm_state: 'draft'
    )

    new_version.file_resources = previous_version.file_resources

    new_version
  end
end
