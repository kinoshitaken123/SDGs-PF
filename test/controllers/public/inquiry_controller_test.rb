require 'test_helper'

class Public::InquiryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_inquiry_index_url
    assert_response :success
  end

  test "should get confirm" do
    get public_inquiry_confirm_url
    assert_response :success
  end

  test "should get thanks" do
    get public_inquiry_thanks_url
    assert_response :success
  end

end
