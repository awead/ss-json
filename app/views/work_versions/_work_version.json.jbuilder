# frozen_string_literal: true

json.extract! work_version, :id, :created_at, :updated_at
json.url work_version_url(work_version, format: :json)
