require "application_system_test_case"

class IconsTest < ApplicationSystemTestCase
  setup do
    @icon = icons(:one)
  end

  test "visiting the index" do
    visit icons_url
    assert_selector "h1", text: "Icons"
  end

  test "creating a Icon" do
    visit icons_url
    click_on "New Icon"

    click_on "Create Icon"

    assert_text "Icon was successfully created"
    click_on "Back"
  end

  test "updating a Icon" do
    visit icons_url
    click_on "Edit", match: :first

    click_on "Update Icon"

    assert_text "Icon was successfully updated"
    click_on "Back"
  end

  test "destroying a Icon" do
    visit icons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Icon was successfully destroyed"
  end
end
