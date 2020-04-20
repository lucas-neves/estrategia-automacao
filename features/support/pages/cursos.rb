# frozen_string_literal: true

# Page object: Cursos
class Cursos
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

  def primeiro_resultado_filtrado
    resultado_filtrado.find(:css, 'section:nth-child(1) > h1 > a', wait: 180).text
  end

end
