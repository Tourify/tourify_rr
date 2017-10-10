require 'test_helper'

class TourControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tour_index_url
    assert_response :success
  end

  test "should get show" do
    get tour_show_url
    assert_response :success
  end

  test "should get create" do
    get tour_create_url
    assert_response :success
  end

  test "should get update" do
    get tour_update_url
    assert_response :success
  end

  test "should get destroy" do
    get tour_destroy_url
    assert_response :success
  end

end
