# frozen_string_literal: true

class Audit < ApplicationRecord
  belongs_to :auditable, polymorphic: true
  belongs_to :user

  before_save :add_stacktrace_to_comment

  def stacktrace
    comment.split("\n").reject { |caller| caller.exclude?('/irb') && caller.include?('/gems') }
  end

  def add_stacktrace_to_comment
    self.comment = caller.join("\n")
  end
end
