require "test_helper"

class VenturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @venture = ventures(:one)
  end

  test "should get index" do
    get ventures_url
    assert_response :success
  end

  test "should get new" do
    get new_venture_url
    assert_response :success
  end

  test "should create venture" do
    assert_difference("Venture.count") do
      post ventures_url, params: { venture: { description: @venture.description, labels: @venture.labels, logo: @venture.logo, name: @venture.name, org_size: @venture.org_size, status: @venture.status, year_started: @venture.year_started } }
    end

    assert_redirected_to venture_url(Venture.last)
  end

  test "should show venture" do
    get venture_url(@venture)
    assert_response :success
  end

  test "should get edit" do
    get edit_venture_url(@venture)
    assert_response :success
  end

  test "should update venture" do
    patch venture_url(@venture), params: { venture: { description: @venture.description, labels: @venture.labels, logo: @venture.logo, name: @venture.name, org_size: @venture.org_size, status: @venture.status, year_started: @venture.year_started } }
    assert_redirected_to venture_url(@venture)
  end

  test "should destroy venture" do
    assert_difference("Venture.count", -1) do
      delete venture_url(@venture)
    end

    assert_redirected_to ventures_url
  end
end
