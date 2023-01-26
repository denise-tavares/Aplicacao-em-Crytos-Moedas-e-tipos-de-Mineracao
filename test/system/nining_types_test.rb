require "application_system_test_case"

class NiningTypesTest < ApplicationSystemTestCase
  setup do
    @nining_type = nining_types(:one)
  end

  test "visiting the index" do
    visit nining_types_url
    assert_selector "h1", text: "Nining Types"
  end

  test "creating a Nining type" do
    visit nining_types_url
    click_on "New Nining Type"

    fill_in "Acronym", with: @nining_type.acronym
    fill_in "Description", with: @nining_type.description
    click_on "Create Nining type"

    assert_text "Nining type was successfully created"
    click_on "Back"
  end

  test "updating a Nining type" do
    visit nining_types_url
    click_on "Edit", match: :first

    fill_in "Acronym", with: @nining_type.acronym
    fill_in "Description", with: @nining_type.description
    click_on "Update Nining type"

    assert_text "Nining type was successfully updated"
    click_on "Back"
  end

  test "destroying a Nining type" do
    visit nining_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Nining type was successfully destroyed"
  end
end
