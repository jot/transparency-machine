require 'test_helper'

class AgendaDocsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:agenda_docs)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_agenda_doc
    assert_difference('AgendaDoc.count') do
      post :create, :agenda_doc => { }
    end

    assert_redirected_to agenda_doc_path(assigns(:agenda_doc))
  end

  def test_should_show_agenda_doc
    get :show, :id => agenda_docs(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => agenda_docs(:one).id
    assert_response :success
  end

  def test_should_update_agenda_doc
    put :update, :id => agenda_docs(:one).id, :agenda_doc => { }
    assert_redirected_to agenda_doc_path(assigns(:agenda_doc))
  end

  def test_should_destroy_agenda_doc
    assert_difference('AgendaDoc.count', -1) do
      delete :destroy, :id => agenda_docs(:one).id
    end

    assert_redirected_to agenda_docs_path
  end
end
