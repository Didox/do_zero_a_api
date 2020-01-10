require 'test_helper'

class GerenciamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gerenciamento = gerenciamentos(:one)
  end

  test "should get index" do
    get gerenciamentos_url
    assert_response :success
  end

  test "should get new" do
    get new_gerenciamento_url
    assert_response :success
  end

  test "should create gerenciamento" do
    assert_difference('Gerenciamento.count') do
      post gerenciamentos_url, params: { gerenciamento: { descritivo: @gerenciamento.descritivo, nome: @gerenciamento.nome, versao: @gerenciamento.versao } }
    end

    assert_redirected_to gerenciamento_url(Gerenciamento.last)
  end

  test "should show gerenciamento" do
    get gerenciamento_url(@gerenciamento)
    assert_response :success
  end

  test "should get edit" do
    get edit_gerenciamento_url(@gerenciamento)
    assert_response :success
  end

  test "should update gerenciamento" do
    patch gerenciamento_url(@gerenciamento), params: { gerenciamento: { descritivo: @gerenciamento.descritivo, nome: @gerenciamento.nome, versao: @gerenciamento.versao } }
    assert_redirected_to gerenciamento_url(@gerenciamento)
  end

  test "should destroy gerenciamento" do
    assert_difference('Gerenciamento.count', -1) do
      delete gerenciamento_url(@gerenciamento)
    end

    assert_redirected_to gerenciamentos_url
  end
end
