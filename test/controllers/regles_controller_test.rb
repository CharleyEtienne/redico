require 'test_helper'

class ReglesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @regle = regles(:one)
  end

  test "should get index" do
    get regles_url
    assert_response :success
  end

  test "should get new" do
    get new_regle_url
    assert_response :success
  end

  test "should create regle" do
    assert_difference('Regle.count') do
      post regles_url, params: { regle: { content: @regle.content, num: @regle.num } }
    end

    assert_redirected_to regle_url(Regle.last)
  end

  test "should show regle" do
    get regle_url(@regle)
    assert_response :success
  end

  test "should get edit" do
    get edit_regle_url(@regle)
    assert_response :success
  end

  test "should update regle" do
    patch regle_url(@regle), params: { regle: { content: @regle.content, num: @regle.num } }
    assert_redirected_to regle_url(@regle)
  end

  test "should destroy regle" do
    assert_difference('Regle.count', -1) do
      delete regle_url(@regle)
    end

    assert_redirected_to regles_url
  end
end
