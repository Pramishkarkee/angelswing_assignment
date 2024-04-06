require "test_helper"

class Api::V1::ContentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_content_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_content_show_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_content_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_content_update_url
    assert_response :success
  end
end
