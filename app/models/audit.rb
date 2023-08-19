# frozen_string_literal: true

class Audit < ApplicationRecord
  belongs_to :auditable, polymorphic: true
  belongs_to :user
end
