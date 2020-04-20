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

# --------------------- verificando página de resultados --------------------- #
Dado('que estou na página de resultados') do
  # busca por palavra-chave
  expect(@cursos.page_name).to have_content 'Resultado da busca'
end

# --------------------- acessando o detalhamento do pacote --------------------- #
Quando('seleciono um item para ser detalhado') do
  # acessar detalhamento do pacote
  @cursos.acessar_detalhes_item
end

# --------------------- verificando página de detalhamento do pacote --------------------- #
E('sistema direciona para página de detalhamento do pacote') do
  # verificar título da página
  expect(@cursosPorProf.page_name).to have_content @professor
end

# --------------------- capturando o valor do curso para asserção e entrando --------------------- #
E('entro no item capturando seu valor parcelado') do
  # acessar detalhamento do item
  @calculoParcelado = @cursosPorProf.capturar_valor_parcelado
  @cursosPorProf.acessar_detalhes_item
end

# --------------------- verificando página de detalhamento do curso --------------------- #
Entao('sistema direciona para página de detalhamente do curso') do
  # verificar título da página
  expect(@detalhes.page_name).to have_content 'Cursos por concurso'
  expect(@calculoParcelado).to eql @detalhes.capturar_valor_total 
end