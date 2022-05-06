require "application_system_test_case"

class TaxaTest < ApplicationSystemTestCase
  setup do
    @taxon = taxa(:one)
  end

  test "visiting the index" do
    visit taxa_url
    assert_selector "h1", text: "Taxa"
  end

  test "should create taxon" do
    visit taxa_url
    click_on "New taxon"

    fill_in "Cover photo", with: @taxon.cover_photo
    fill_in "Description", with: @taxon.description
    fill_in "Link", with: @taxon.link
    fill_in "Name", with: @taxon.name
    click_on "Create Taxon"

    assert_text "Taxon was successfully created"
    click_on "Back"
  end

  test "should update Taxon" do
    visit taxon_url(@taxon)
    click_on "Edit this taxon", match: :first

    fill_in "Cover photo", with: @taxon.cover_photo
    fill_in "Description", with: @taxon.description
    fill_in "Link", with: @taxon.link
    fill_in "Name", with: @taxon.name
    click_on "Update Taxon"

    assert_text "Taxon was successfully updated"
    click_on "Back"
  end

  test "should destroy Taxon" do
    visit taxon_url(@taxon)
    click_on "Destroy this taxon", match: :first

    assert_text "Taxon was successfully destroyed"
  end
end
