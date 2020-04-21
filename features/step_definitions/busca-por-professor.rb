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
E('sistema exibe na lista o resultado filtrado') do
  # verificando página de resultados
  expect(@cursosPorFiltro.page_name).to have_content 'Cursos por professor'
  expect(@cursos.primeiro_resultado_filtrado).to have_content @professor
end

# --------------------- acessando o detalhamento do pacote --------------------- #
Quando('seleciono um pacote para ser detalhado') do
  # acessar detalhamento do pacote
  @cursosPorFiltro.acessar_detalhes_item
end

# --------------------- verificando página de detalhamento do pacote --------------------- #
E('sistema direciona para página de detalhamento do pacote') do
  # verificar título da página
  expect(@cursosPorFiltro.package_page_name).to have_content @professor
end

# --------------------- capturando o valor do curso para asserção e entrando --------------------- #
E('entro no item capturando seu valor parcelado') do
  # acessar detalhamento do item
  @calculoParcelado = @cursosPorFiltro.capturar_valor_parcelado
  @cursosPorFiltro.acessar_detalhes_item
end