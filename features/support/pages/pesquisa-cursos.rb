# frozen_string_literal: true

# Page object: PesquisaCursos
class PesquisaCursos
  include Capybara::DSL

  # get page name
  def page_name
    find(:css, 'h1.title').text
  end

  # filter for:
  def filtrar_por_palavra(keyword)
    sleep 5
    el = find(:css, "form.search input")
    el.set(keyword)
    el.send_keys :return
  end

  # get first filtered result text
  def primeiro_resultado_filtrado
    find(:css, 'section:nth-child(1) > h1 > a').text
  end

  # click on first result details
  def acessar_detalhes_item
    find(:css, 'section:nth-child(1) > a.card-prod-details').click
  end

  # validate result list
  def validar_lista_resultados()
    within all('.page-result-list section')[0] do
      
    end
  end

end
