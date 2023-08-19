# frozen_string_literal: true

class Answer < ApplicationRecord
  include Auditable

  belongs_to :question
end
