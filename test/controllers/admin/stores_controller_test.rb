require 'test_helper'

class Admin::StoresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_stores_index_url
    assert_response :success
  end

  test "should get create" do
    get admin_stores_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_stores_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_stores_update_url
    assert_response :success
  end

end
