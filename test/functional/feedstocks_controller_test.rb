require 'test_helper'

class FeedstocksControllerTest < ActionController::TestCase
  setup do
    @feedstock = feedstocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feedstocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feedstock" do
    assert_difference('Feedstock.count') do
      post :create, feedstock: { name: @feedstock.name, unity: @feedstock.unity }
    end

    assert_redirected_to feedstock_path(assigns(:feedstock))
  end

  test "should show feedstock" do
    get :show, id: @feedstock
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feedstock
    assert_response :success
  end

  test "should update feedstock" do
    put :update, id: @feedstock, feedstock: { name: @feedstock.name, unity: @feedstock.unity }
    assert_redirected_to feedstock_path(assigns(:feedstock))
  end

  test "should destroy feedstock" do
    assert_difference('Feedstock.count', -1) do
      delete :destroy, id: @feedstock
    end

    assert_redirected_to feedstocks_path
  end
end
