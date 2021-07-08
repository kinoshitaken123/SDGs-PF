require 'test_helper'

class Admin::RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_rooms_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_rooms_show_url
    assert_response :success
  end

end
