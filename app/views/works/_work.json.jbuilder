# frozen_string_literal: true

json.extract! work,
              :id,
              :title,
              :subtitle,
              :keywords,
              :rights,
              :description,
              :resource_type,
              :contributor,
              :publisher,
              :published_date,
              :subject,
              :language,
              :identifier,
              :based_near,
              :related_url,
              :source,
              :created_at,
              :updated_at
json.url work_url(work, format: :json)
