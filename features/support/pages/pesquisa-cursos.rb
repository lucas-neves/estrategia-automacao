# frozen_string_literal: true

# Page object: PesquisaCursos
class PesquisaCursos
  include Capybara::DSL

  # get page name
  def page_name
    find(:css, 'h1.title', wait: 180).text
  end

  # filter for:
  def filtrar_por_palavra(keyword)
    sleep 5
    el = find(:css, "form.search input")
    el.set(keyword)
    el.send_keys :return
  end

  # get filtered results
  def resultado_filtrado
    find(:css, '.page-result-list')
  end

  # get first result text
  def primeiro_resultado_filtrado
    resultado_filtrado.find(:css, 'section:nth-child(1) > h1 > a', wait: 180).text
  end

  # click on first result details
  def acessar_detalhes_item
    resultado_filtrado.find(:css, 'section > a', wait: 180).click
  end

  # validate result list
  def validar_lista_resultados()
    within all('.page-result-list section')[0] do
      
    end
  end

end
