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

# --------------------- verificando página de resultados --------------------- #
E('sistema direciona para página de resultados') do
  expect(@cursos.page_name).to have_content 'Resultado da busca'
end
  
# --------------------- verificando os resultados --------------------- #
E('verifico se os resultados contém o termo {string}') do |palavra|
  expect(@cursos.primeiro_resultado_filtrado).to have_content palavra
end

# --------------------- selecionando um curso --------------------- #
Quando('seleciono um item para ser detalhado') do
  @calculoParcelado = @cursosPorFiltro.capturar_valor_parcelado
  @cursos.acessar_detalhes_item
end

# --------------------- filtrando cursos por texto --------------------- #
Entao('sistema direciona para página de detalhamento do curso') do
  # verificando página de detalhamento
  expect(@detalhes.page_name).to have_content 'Cursos por concurso'
  expect(@calculoParcelado).to eql @detalhes.capturar_valor_total
end
