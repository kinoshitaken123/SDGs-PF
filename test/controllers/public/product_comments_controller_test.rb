require 'test_helper'

class Public::ProductCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get public_product_comments_destroy_url
    assert_response :success
  end

  test "should get create" do
    get public_product_comments_create_url
    assert_response :success
  end
end
