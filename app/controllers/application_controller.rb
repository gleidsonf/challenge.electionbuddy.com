# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Current
  around_action :set_current_user

  private

  def set_current_user
    Current.user = current_user
    yield
  ensure
    Current.user = nil
  end
end
