# frozen_string_literal: true

# --------------------- contexto --------------------- #
Dado('que estou na página inicial do sistema') do
  url = 'https://www.estrategiaconcursos.com.br/'
  visit url

  @home.confirm_alert
  # verificando conteúdo da página
  expect(page).to have_selector(:xpath, '//h1[contains(text(),"Últimas notícias")]', visible: true)
end

# --------------------- filtrando cursos por texto --------------------- #
Quando('preencho o campo de pesquisa de cursos com {string} e pesquiso') do |palavra|
  # busca por palavra-chave
  @home.busca_palavra_chave(palavra)
end

# --------------------- filtrando cursos por texto --------------------- #
Entao('sistema direciona para página de resultados') do
  # verificando página de resultados
  expect(@cursos.page_name).to have_content 'Resultado da busca'
end