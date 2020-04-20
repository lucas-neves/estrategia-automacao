# frozen_string_literal: true

# Page object: Cursos
class CursosPorProfessor
  include Capybara::DSL

  # get page name
  def page_name
    find(:css, '.section-header-title', wait: 180).text
  end

  # click first item
  def acessar_detalhes_item
    find(:css, '.card-prod:nth-child(1) > a', wait: 180).click
  end

  # get item price
  def capturar_valor_parcelado
    mtch = find_all('div.card-prod-price', text: '([1-9]\d{0,2}(,\d{2})*)', match: :prefer_exact)
    numeroParcelas = mtch.first.text
    valorParcelas = mtch.first.text
    puts mtch.count.colorize(:blue)
    puts numeroParcelas.colorize(:blue)
    puts valorParcelas.second.text.colorize(:blue)
    valor_total = numeroParcelas.to_f ** valorParcelas.to_f
    valor_total
  end

end
