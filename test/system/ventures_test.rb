require "application_system_test_case"

class VenturesTest < ApplicationSystemTestCase
  setup do
    @venture = ventures(:one)
  end

  test "visiting the index" do
    visit ventures_url
    assert_selector "h1", text: "Ventures"
  end

  test "should create venture" do
    visit ventures_url
    click_on "New venture"

    fill_in "Description", with: @venture.description
    fill_in "Labels", with: @venture.labels
    fill_in "Logo", with: @venture.logo
    fill_in "Name", with: @venture.name
    fill_in "Org size", with: @venture.org_size
    fill_in "Status", with: @venture.status
    fill_in "Year started", with: @venture.year_started
    click_on "Create Venture"

    assert_text "Venture was successfully created"
    click_on "Back"
  end

  test "should update Venture" do
    visit venture_url(@venture)
    click_on "Edit this venture", match: :first

    fill_in "Description", with: @venture.description
    fill_in "Labels", with: @venture.labels
    fill_in "Logo", with: @venture.logo
    fill_in "Name", with: @venture.name
    fill_in "Org size", with: @venture.org_size
    fill_in "Status", with: @venture.status
    fill_in "Year started", with: @venture.year_started
    click_on "Update Venture"

    assert_text "Venture was successfully updated"
    click_on "Back"
  end

  test "should destroy Venture" do
    visit venture_url(@venture)
    click_on "Destroy this venture", match: :first

    assert_text "Venture was successfully destroyed"
  end
end
