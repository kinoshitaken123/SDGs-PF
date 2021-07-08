require 'test_helper'

class Admin::OrderedProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admin_ordered_products_update_url
    assert_response :success
  end

end
