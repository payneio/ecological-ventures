require "application_system_test_case"

class EcosystemsTest < ApplicationSystemTestCase
  setup do
    @ecosystem = ecosystems(:one)
  end

  test "visiting the index" do
    visit ecosystems_url
    assert_selector "h1", text: "Ecosystems"
  end

  test "should create ecosystem" do
    visit ecosystems_url
    click_on "New ecosystem"

    fill_in "Cover photo", with: @ecosystem.cover_photo
    fill_in "Description", with: @ecosystem.description
    fill_in "Link", with: @ecosystem.link
    fill_in "Name", with: @ecosystem.name
    click_on "Create Ecosystem"

    assert_text "Ecosystem was successfully created"
    click_on "Back"
  end

  test "should update Ecosystem" do
    visit ecosystem_url(@ecosystem)
    click_on "Edit this ecosystem", match: :first

    fill_in "Cover photo", with: @ecosystem.cover_photo
    fill_in "Description", with: @ecosystem.description
    fill_in "Link", with: @ecosystem.link
    fill_in "Name", with: @ecosystem.name
    click_on "Update Ecosystem"

    assert_text "Ecosystem was successfully updated"
    click_on "Back"
  end

  test "should destroy Ecosystem" do
    visit ecosystem_url(@ecosystem)
    click_on "Destroy this ecosystem", match: :first

    assert_text "Ecosystem was successfully destroyed"
  end
end
