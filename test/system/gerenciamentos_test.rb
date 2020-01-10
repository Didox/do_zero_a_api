require "application_system_test_case"

class GerenciamentosTest < ApplicationSystemTestCase
  setup do
    @gerenciamento = gerenciamentos(:one)
  end

  test "visiting the index" do
    visit gerenciamentos_url
    assert_selector "h1", text: "Gerenciamentos"
  end

  test "creating a Gerenciamento" do
    visit gerenciamentos_url
    click_on "New Gerenciamento"

    fill_in "Descritivo", with: @gerenciamento.descritivo
    fill_in "Nome", with: @gerenciamento.nome
    fill_in "Versao", with: @gerenciamento.versao
    click_on "Create Gerenciamento"

    assert_text "Gerenciamento was successfully created"
    click_on "Back"
  end

  test "updating a Gerenciamento" do
    visit gerenciamentos_url
    click_on "Edit", match: :first

    fill_in "Descritivo", with: @gerenciamento.descritivo
    fill_in "Nome", with: @gerenciamento.nome
    fill_in "Versao", with: @gerenciamento.versao
    click_on "Update Gerenciamento"

    assert_text "Gerenciamento was successfully updated"
    click_on "Back"
  end

  test "destroying a Gerenciamento" do
    visit gerenciamentos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gerenciamento was successfully destroyed"
  end
end
