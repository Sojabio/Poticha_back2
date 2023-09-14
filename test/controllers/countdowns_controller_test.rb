require "test_helper"

class CountdownsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @countdown = countdowns(:one)
  end

  test "should get index" do
    get countdowns_url, as: :json
    assert_response :success
  end

  test "should create countdown" do
    assert_difference("Countdown.count") do
      post countdowns_url, params: { countdown: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show countdown" do
    get countdown_url(@countdown), as: :json
    assert_response :success
  end

  test "should update countdown" do
    patch countdown_url(@countdown), params: { countdown: {  } }, as: :json
    assert_response :success
  end

  test "should destroy countdown" do
    assert_difference("Countdown.count", -1) do
      delete countdown_url(@countdown), as: :json
    end

    assert_response :no_content
  end
end
