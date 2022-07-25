require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:one)
  end

  test "visiting the index" do
    visit people_url
    assert_selector "h1", text: "People"
  end

  test "should create person" do
    visit people_url
    click_on "New person"

    fill_in "Address", with: @person.address
    fill_in "Avatar", with: @person.avatar
    fill_in "Bio", with: @person.bio
    fill_in "Country", with: @person.country
    fill_in "Email", with: @person.email
    fill_in "Facebook", with: @person.facebook
    fill_in "Interests", with: @person.interests
    check "Is public" if @person.is_public
    fill_in "Linkedin", with: @person.linkedin
    fill_in "Name", with: @person.name
    fill_in "Phone", with: @person.phone
    fill_in "Portrait", with: @person.portrait
    fill_in "Website", with: @person.website
    click_on "Create Person"

    assert_text "Person was successfully created"
    click_on "Back"
  end

  test "should update Person" do
    visit person_url(@person)
    click_on "Edit this person", match: :first

    fill_in "Address", with: @person.address
    fill_in "Avatar", with: @person.avatar
    fill_in "Bio", with: @person.bio
    fill_in "Country", with: @person.country
    fill_in "Email", with: @person.email
    fill_in "Facebook", with: @person.facebook
    fill_in "Interests", with: @person.interests
    check "Is public" if @person.is_public
    fill_in "Linkedin", with: @person.linkedin
    fill_in "Name", with: @person.name
    fill_in "Phone", with: @person.phone
    fill_in "Portrait", with: @person.portrait
    fill_in "Website", with: @person.website
    click_on "Update Person"

    assert_text "Person was successfully updated"
    click_on "Back"
  end

  test "should destroy Person" do
    visit person_url(@person)
    click_on "Destroy this person", match: :first

    assert_text "Person was successfully destroyed"
  end
end
