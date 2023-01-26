require 'test_helper'

class NiningTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nining_type = nining_types(:one)
  end

  test "should get index" do
    get nining_types_url
    assert_response :success
  end

  test "should get new" do
    get new_nining_type_url
    assert_response :success
  end

  test "should create nining_type" do
    assert_difference('NiningType.count') do
      post nining_types_url, params: { nining_type: { acronym: @nining_type.acronym, description: @nining_type.description } }
    end

    assert_redirected_to nining_type_url(NiningType.last)
  end

  test "should show nining_type" do
    get nining_type_url(@nining_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_nining_type_url(@nining_type)
    assert_response :success
  end

  test "should update nining_type" do
    patch nining_type_url(@nining_type), params: { nining_type: { acronym: @nining_type.acronym, description: @nining_type.description } }
    assert_redirected_to nining_type_url(@nining_type)
  end

  test "should destroy nining_type" do
    assert_difference('NiningType.count', -1) do
      delete nining_type_url(@nining_type)
    end

    assert_redirected_to nining_types_url
  end
end
