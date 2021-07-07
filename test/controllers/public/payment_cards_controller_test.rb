require 'test_helper'

class Public::PaymentCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_payment_cards_create_url
    assert_response :success
  end

  test "should get index" do
    get public_payment_cards_index_url
    assert_response :success
  end

  test "should get destroy" do
    get public_payment_cards_destroy_url
    assert_response :success
  end

  test "should get new" do
    get public_payment_cards_new_url
    assert_response :success
  end

end
