require "test_helper"

class MilksControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get milks_show_url
    assert_response :success
  end

  test "should get index" do
    get milks_index_url
    assert_response :success
  end

  test "should get new" do
    get milks_new_url
    assert_response :success
  end

  test "should get edit" do
    get milks_edit_url
    assert_response :success
  end
end
