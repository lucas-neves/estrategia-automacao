# frozen_string_literal: true

# --------------------- filtrando cursos 'Por professor' --------------------- #
Quando('clico no botão de filtro Por professor') do
  # busca por palavra-chave
  @home.clicar_filtro_por('a[href$="/cursos/professor/"]')
end

# --------------------- filtrando o resultado da busca --------------------- #
E('preencho o campo de filtro com o {string} e pesquiso') do |nome|
  # busca por nome
  @professor = nome
  @cursos.filtrar_por_palavra(nome)
end

# --------------------- exibição do conteúdo filtrado --------------------- #
Entao('sistema exibe na lista o resultado filtrado') do
  # verificando página de resultados
  expect(@cursos.resultado_filtrado).to have_selector('section', count: 1)
  expect(@cursos.primeiro_resultado_filtrado).to have_content @professor
end

# --------------------- verificando  --------------------- #
Dado('que estou na página de resultados') do
  # busca por palavra-chave
  expect(@cursos.page_name).to have_content 'Resultado da busca'
end