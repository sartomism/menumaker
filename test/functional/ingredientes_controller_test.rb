require 'test_helper'

class IngredientesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ingredientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ingrediente" do
    assert_difference('Ingrediente.count') do
      post :create, :ingrediente => { }
    end

    assert_redirected_to ingrediente_path(assigns(:ingrediente))
  end

  test "should show ingrediente" do
    get :show, :id => ingredientes(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ingredientes(:one).id
    assert_response :success
  end

  test "should update ingrediente" do
    put :update, :id => ingredientes(:one).id, :ingrediente => { }
    assert_redirected_to ingrediente_path(assigns(:ingrediente))
  end

  test "should destroy ingrediente" do
    assert_difference('Ingrediente.count', -1) do
      delete :destroy, :id => ingredientes(:one).id
    end

    assert_redirected_to ingredientes_path
  end
end
