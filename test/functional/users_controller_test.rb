require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { address: @user.address, cel_number: @user.cel_number, cep: @user.cep, city: @user.city, cpf: @user.cpf, dateofbirth: @user.dateofbirth, email: @user.email, fire_date: @user.fire_date, hide_date: @user.hide_date, name: @user.name, observations: @user.observations, phone1: @user.phone1, phone2: @user.phone2, rg: @user.rg, sex: @user.sex, state: @user.state, wage: @user.wage }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { address: @user.address, cel_number: @user.cel_number, cep: @user.cep, city: @user.city, cpf: @user.cpf, dateofbirth: @user.dateofbirth, email: @user.email, fire_date: @user.fire_date, hide_date: @user.hide_date, name: @user.name, observations: @user.observations, phone1: @user.phone1, phone2: @user.phone2, rg: @user.rg, sex: @user.sex, state: @user.state, wage: @user.wage }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
