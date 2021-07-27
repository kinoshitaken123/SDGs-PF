require 'test_helper'

class Public::GenreControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_genre_show_url
    assert_response :success
  end
end
