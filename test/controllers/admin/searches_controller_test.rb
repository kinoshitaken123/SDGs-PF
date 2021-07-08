require 'test_helper'

class Admin::SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get searches" do
    get admin_searches_searches_url
    assert_response :success
  end

end
