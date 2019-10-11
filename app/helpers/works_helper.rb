# frozen_string_literal: true

module WorksHelper
  def work_version_badge(work_version, optional_class: '')
    klass = work_version.draft? ? 'badge-secondary' : 'badge-primary'
    title = work_version.aasm_state

    %(<span class="badge #{klass} #{optional_class}">#{title}</span>).html_safe
  end
end
