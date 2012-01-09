require 'test_helper'

class EtiquetaingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:etiquetaings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create etiquetaing" do
    assert_difference('Etiquetaing.count') do
      post :create, :etiquetaing => { }
    end

    assert_redirected_to etiquetaing_path(assigns(:etiquetaing))
  end

  test "should show etiquetaing" do
    get :show, :id => etiquetaings(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => etiquetaings(:one).id
    assert_response :success
  end

  test "should update etiquetaing" do
    put :update, :id => etiquetaings(:one).id, :etiquetaing => { }
    assert_redirected_to etiquetaing_path(assigns(:etiquetaing))
  end

  test "should destroy etiquetaing" do
    assert_difference('Etiquetaing.count', -1) do
      delete :destroy, :id => etiquetaings(:one).id
    end

    assert_redirected_to etiquetaings_path
  end
end
