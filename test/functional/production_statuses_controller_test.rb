require 'test_helper'

class ProductionStatusesControllerTest < ActionController::TestCase
  setup do
    @production_status = production_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:production_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create production_status" do
    assert_difference('ProductionStatus.count') do
      post :create, production_status: { name: @production_status.name }
    end

    assert_redirected_to production_status_path(assigns(:production_status))
  end

  test "should show production_status" do
    get :show, id: @production_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @production_status
    assert_response :success
  end

  test "should update production_status" do
    put :update, id: @production_status, production_status: { name: @production_status.name }
    assert_redirected_to production_status_path(assigns(:production_status))
  end

  test "should destroy production_status" do
    assert_difference('ProductionStatus.count', -1) do
      delete :destroy, id: @production_status
    end

    assert_redirected_to production_statuses_path
  end
end
