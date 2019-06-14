require "application_system_test_case"

class AcessosApisTest < ApplicationSystemTestCase
  setup do
    @acessos_api = acessos_apis(:one)
  end

  test "visiting the index" do
    visit acessos_apis_url
    assert_selector "h1", text: "Acessos Apis"
  end

  test "creating a Acessos api" do
    visit acessos_apis_url
    click_on "New Acessos Api"

    fill_in "Token", with: @acessos_api.token
    fill_in "Url", with: @acessos_api.url
    click_on "Create Acessos api"

    assert_text "Acessos api was successfully created"
    click_on "Back"
  end

  test "updating a Acessos api" do
    visit acessos_apis_url
    click_on "Edit", match: :first

    fill_in "Token", with: @acessos_api.token
    fill_in "Url", with: @acessos_api.url
    click_on "Update Acessos api"

    assert_text "Acessos api was successfully updated"
    click_on "Back"
  end

  test "destroying a Acessos api" do
    visit acessos_apis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Acessos api was successfully destroyed"
  end
end
