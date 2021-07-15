require 'test_helper'

class Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get admin_orders_top_url
    assert_response :success
  end

  test "should get customer_top" do
    get admin_orders_customer_top_url
    assert_response :success
  end

  test "should get show" do
    get admin_orders_show_url
    assert_response :success
  end

  test "should get update" do
    get admin_orders_update_url
    assert_response :success
  end

end
