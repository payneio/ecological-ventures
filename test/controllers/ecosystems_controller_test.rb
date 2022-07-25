require "test_helper"

class EcosystemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ecosystem = ecosystems(:one)
  end

  test "should get index" do
    get ecosystems_url
    assert_response :success
  end

  test "should get new" do
    get new_ecosystem_url
    assert_response :success
  end

  test "should create ecosystem" do
    assert_difference("Ecosystem.count") do
      post ecosystems_url, params: { ecosystem: { cover_photo: @ecosystem.cover_photo, description: @ecosystem.description, link: @ecosystem.link, name: @ecosystem.name } }
    end

    assert_redirected_to ecosystem_url(Ecosystem.last)
  end

  test "should show ecosystem" do
    get ecosystem_url(@ecosystem)
    assert_response :success
  end

  test "should get edit" do
    get edit_ecosystem_url(@ecosystem)
    assert_response :success
  end

  test "should update ecosystem" do
    patch ecosystem_url(@ecosystem), params: { ecosystem: { cover_photo: @ecosystem.cover_photo, description: @ecosystem.description, link: @ecosystem.link, name: @ecosystem.name } }
    assert_redirected_to ecosystem_url(@ecosystem)
  end

  test "should destroy ecosystem" do
    assert_difference("Ecosystem.count", -1) do
      delete ecosystem_url(@ecosystem)
    end

    assert_redirected_to ecosystems_url
  end
end
