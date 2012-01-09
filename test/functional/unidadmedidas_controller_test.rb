require 'test_helper'

class UnidadmedidasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unidadmedidas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unidadmedida" do
    assert_difference('Unidadmedida.count') do
      post :create, :unidadmedida => { }
    end

    assert_redirected_to unidadmedida_path(assigns(:unidadmedida))
  end

  test "should show unidadmedida" do
    get :show, :id => unidadmedidas(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => unidadmedidas(:one).id
    assert_response :success
  end

  test "should update unidadmedida" do
    put :update, :id => unidadmedidas(:one).id, :unidadmedida => { }
    assert_redirected_to unidadmedida_path(assigns(:unidadmedida))
  end

  test "should destroy unidadmedida" do
    assert_difference('Unidadmedida.count', -1) do
      delete :destroy, :id => unidadmedidas(:one).id
    end

    assert_redirected_to unidadmedidas_path
  end
end
