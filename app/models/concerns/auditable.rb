# frozen_string_literal: true

module Auditable
  extend ActiveSupport::Concern

  included do
    has_many :audits, as: :auditable

    after_commit :persist_audit, on: %i[create update]
  end

  private

  def persist_audit
    audits.create!(
      user: Current.user,
      auditable_changes: previous_changes
    )
  end
end
