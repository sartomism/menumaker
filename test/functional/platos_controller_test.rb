require 'test_helper'

class PlatosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:platos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plato" do
    assert_difference('Plato.count') do
      post :create, :plato => { }
    end

    assert_redirected_to plato_path(assigns(:plato))
  end

  test "should show plato" do
    get :show, :id => platos(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => platos(:one).id
    assert_response :success
  end

  test "should update plato" do
    put :update, :id => platos(:one).id, :plato => { }
    assert_redirected_to plato_path(assigns(:plato))
  end

  test "should destroy plato" do
    assert_difference('Plato.count', -1) do
      delete :destroy, :id => platos(:one).id
    end

    assert_redirected_to platos_path
  end
end
