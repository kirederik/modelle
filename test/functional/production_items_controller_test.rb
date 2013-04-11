require 'test_helper'

class ProductionItemsControllerTest < ActionController::TestCase
  setup do
    @production_item = production_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:production_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create production_item" do
    assert_difference('ProductionItem.count') do
      post :create, production_item: {  }
    end

    assert_redirected_to production_item_path(assigns(:production_item))
  end

  test "should show production_item" do
    get :show, id: @production_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @production_item
    assert_response :success
  end

  test "should update production_item" do
    put :update, id: @production_item, production_item: {  }
    assert_redirected_to production_item_path(assigns(:production_item))
  end

  test "should destroy production_item" do
    assert_difference('ProductionItem.count', -1) do
      delete :destroy, id: @production_item
    end

    assert_redirected_to production_items_path
  end
end
