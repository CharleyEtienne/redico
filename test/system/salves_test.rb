require "application_system_test_case"

class SalvesTest < ApplicationSystemTestCase
  setup do
    @salf = salves(:one)
  end

  test "visiting the index" do
    visit salves_url
    assert_selector "h1", text: "Salves"
  end

  test "creating a Salve" do
    visit salves_url
    click_on "New Salve"

    check "Finished" if @salf.finished
    fill_in "Topic", with: @salf.topic_id
    fill_in "User", with: @salf.user_id
    click_on "Create Salve"

    assert_text "Salve was successfully created"
    click_on "Back"
  end

  test "updating a Salve" do
    visit salves_url
    click_on "Edit", match: :first

    check "Finished" if @salf.finished
    fill_in "Topic", with: @salf.topic_id
    fill_in "User", with: @salf.user_id
    click_on "Update Salve"

    assert_text "Salve was successfully updated"
    click_on "Back"
  end

  test "destroying a Salve" do
    visit salves_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Salve was successfully destroyed"
  end
end
