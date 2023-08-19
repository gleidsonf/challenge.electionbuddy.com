require "application_system_test_case"

class AuditsTest < ApplicationSystemTestCase
  setup do
    @audit = audits(:one)
  end

  test "visiting the index" do
    visit audits_url
    assert_selector "h1", text: "Audits"
    assert_selector "td", text: @audit.user.email
  end
end
