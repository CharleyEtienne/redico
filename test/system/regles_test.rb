require "application_system_test_case"

class ReglesTest < ApplicationSystemTestCase
  setup do
    @regle = regles(:one)
  end

  test "visiting the index" do
    visit regles_url
    assert_selector "h1", text: "Regles"
  end

  test "creating a Regle" do
    visit regles_url
    click_on "New Regle"

    fill_in "Content", with: @regle.content
    fill_in "Num", with: @regle.num
    click_on "Create Regle"

    assert_text "Regle was successfully created"
    click_on "Back"
  end

  test "updating a Regle" do
    visit regles_url
    click_on "Edit", match: :first

    fill_in "Content", with: @regle.content
    fill_in "Num", with: @regle.num
    click_on "Update Regle"

    assert_text "Regle was successfully updated"
    click_on "Back"
  end

  test "destroying a Regle" do
    visit regles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Regle was successfully destroyed"
  end
end
