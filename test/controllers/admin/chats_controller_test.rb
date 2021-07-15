require 'test_helper'

class Admin::ChatsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_chats_create_url
    assert_response :success
  end

end
