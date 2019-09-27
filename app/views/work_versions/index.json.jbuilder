# frozen_string_literal: true

json.array! @work_versions, partial: 'work_versions/work_version', as: :work_version
