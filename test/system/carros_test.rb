require "application_system_test_case"

class CarrosTest < ApplicationSystemTestCase
  setup do
    @carro = carros(:one)
  end

  test "visiting the index" do
    visit carros_url
    assert_selector "h1", text: "Carros"
  end

  test "creating a Carro" do
    visit carros_url
    click_on "New Carro"

    fill_in "Ano", with: @carro.ano
    fill_in "Marca", with: @carro.marca
    fill_in "Modelo", with: @carro.modelo
    fill_in "Nome", with: @carro.nome
    click_on "Create Carro"

    assert_text "Carro was successfully created"
    click_on "Back"
  end

  test "updating a Carro" do
    visit carros_url
    click_on "Edit", match: :first

    fill_in "Ano", with: @carro.ano
    fill_in "Marca", with: @carro.marca
    fill_in "Modelo", with: @carro.modelo
    fill_in "Nome", with: @carro.nome
    click_on "Update Carro"

    assert_text "Carro was successfully updated"
    click_on "Back"
  end

  test "destroying a Carro" do
    visit carros_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Carro was successfully destroyed"
  end
end
