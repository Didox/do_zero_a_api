require 'test_helper'

class AcessosApisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @acessos_api = acessos_apis(:one)
  end

  test "should get index" do
    get acessos_apis_url
    assert_response :success
  end

  test "should get new" do
    get new_acessos_api_url
    assert_response :success
  end

  test "should create acessos_api" do
    assert_difference('AcessosApi.count') do
      post acessos_apis_url, params: { acessos_api: { token: @acessos_api.token, url: @acessos_api.url } }
    end

    assert_redirected_to acessos_api_url(AcessosApi.last)
  end

  test "should show acessos_api" do
    get acessos_api_url(@acessos_api)
    assert_response :success
  end

  test "should get edit" do
    get edit_acessos_api_url(@acessos_api)
    assert_response :success
  end

  test "should update acessos_api" do
    patch acessos_api_url(@acessos_api), params: { acessos_api: { token: @acessos_api.token, url: @acessos_api.url } }
    assert_redirected_to acessos_api_url(@acessos_api)
  end

  test "should destroy acessos_api" do
    assert_difference('AcessosApi.count', -1) do
      delete acessos_api_url(@acessos_api)
    end

    assert_redirected_to acessos_apis_url
  end
end
