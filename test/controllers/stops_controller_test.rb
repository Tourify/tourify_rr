require 'test_helper'

class StopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stops_index_url
    assert_response :success
  end

  test "should get import" do
    get stops_import_url
    assert_response :success
  end

end
