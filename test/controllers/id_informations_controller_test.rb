require 'test_helper'

class IdInformationsControllerTest < ActionController::TestCase
  def test_should_get_show
    FactoryGirl.create :id_informations
    get :show
    assert_response :success
    assert response.body['Alan']
  end

  def test_should_get_edit
    get :edit
    assert_response :success
  end

  def test_should_get_update
    patch :update, id_informations: { first_name: 'Alan', last_name: 'Turing' }
    assert_redirected_to id_informations_show_path
    assert_equal 'Alan', IdInformations.find(1).first_name
  end

end
