require 'test_helper'

class PaymentCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get payment_cards_create_url
    assert_response :success
  end

  test "should get index" do
    get payment_cards_index_url
    assert_response :success
  end

  test "should get destroy" do
    get payment_cards_destroy_url
    assert_response :success
  end

  test "should get new" do
    get payment_cards_new_url
    assert_response :success
  end
end
