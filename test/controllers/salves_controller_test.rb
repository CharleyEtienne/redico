require 'test_helper'

class SalvesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @salf = salves(:one)
  end

  test "should get index" do
    get salves_url
    assert_response :success
  end

  test "should get new" do
    get new_salf_url
    assert_response :success
  end

  test "should create salf" do
    assert_difference('Salve.count') do
      post salves_url, params: { salf: { finished: @salf.finished, topic_id: @salf.topic_id, user_id: @salf.user_id } }
    end

    assert_redirected_to salf_url(Salve.last)
  end

  test "should show salf" do
    get salf_url(@salf)
    assert_response :success
  end

  test "should get edit" do
    get edit_salf_url(@salf)
    assert_response :success
  end

  test "should update salf" do
    patch salf_url(@salf), params: { salf: { finished: @salf.finished, topic_id: @salf.topic_id, user_id: @salf.user_id } }
    assert_redirected_to salf_url(@salf)
  end

  test "should destroy salf" do
    assert_difference('Salve.count', -1) do
      delete salf_url(@salf)
    end

    assert_redirected_to salves_url
  end
end
