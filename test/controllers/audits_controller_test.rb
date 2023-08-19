# frozen_string_literal: true

require 'test_helper'

class AuditsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @audit = audits(:one)
  end

  test 'should get index' do
    get audits_url
    assert_response :success
  end

  test 'should show audit' do
    get audit_url(@audit)
    assert_response :success
  end
end
