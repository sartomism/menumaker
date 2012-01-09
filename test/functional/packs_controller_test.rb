require 'test_helper'

class PacksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:packs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pack" do
    assert_difference('Pack.count') do
      post :create, :pack => { }
    end

    assert_redirected_to pack_path(assigns(:pack))
  end

  test "should show pack" do
    get :show, :id => packs(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => packs(:one).id
    assert_response :success
  end

  test "should update pack" do
    put :update, :id => packs(:one).id, :pack => { }
    assert_redirected_to pack_path(assigns(:pack))
  end

  test "should destroy pack" do
    assert_difference('Pack.count', -1) do
      delete :destroy, :id => packs(:one).id
    end

    assert_redirected_to packs_path
  end
end
