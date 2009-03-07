require 'test_helper'

class MinutesDocsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:minutes_docs)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_minutes_doc
    assert_difference('MinutesDoc.count') do
      post :create, :minutes_doc => { }
    end

    assert_redirected_to minutes_doc_path(assigns(:minutes_doc))
  end

  def test_should_show_minutes_doc
    get :show, :id => minutes_docs(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => minutes_docs(:one).id
    assert_response :success
  end

  def test_should_update_minutes_doc
    put :update, :id => minutes_docs(:one).id, :minutes_doc => { }
    assert_redirected_to minutes_doc_path(assigns(:minutes_doc))
  end

  def test_should_destroy_minutes_doc
    assert_difference('MinutesDoc.count', -1) do
      delete :destroy, :id => minutes_docs(:one).id
    end

    assert_redirected_to minutes_docs_path
  end
end
