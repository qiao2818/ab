require 'test_helper'

class AbInfosControllerTest < ActionController::TestCase
  setup do
    @ab_info = ab_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ab_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ab_info" do
    assert_difference('AbInfo.count') do
      post :create, ab_info: { concurrency_num: @ab_info.concurrency_num, request_num: @ab_info.request_num, response_time: @ab_info.response_time, src: @ab_info.src, target: @ab_info.target, url: @ab_info.url }
    end

    assert_redirected_to ab_info_path(assigns(:ab_info))
  end

  test "should show ab_info" do
    get :show, id: @ab_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ab_info
    assert_response :success
  end

  test "should update ab_info" do
    patch :update, id: @ab_info, ab_info: { concurrency_num: @ab_info.concurrency_num, request_num: @ab_info.request_num, response_time: @ab_info.response_time, src: @ab_info.src, target: @ab_info.target, url: @ab_info.url }
    assert_redirected_to ab_info_path(assigns(:ab_info))
  end

  test "should destroy ab_info" do
    assert_difference('AbInfo.count', -1) do
      delete :destroy, id: @ab_info
    end

    assert_redirected_to ab_infos_path
  end
end
