# frozen_string_literal: true

# Page object: CursosPorFiltro
class CursosPorFiltro
  include Capybara::DSL

  # get page name
  def page_name
    find(:css, '.page-header-title').text
  end

  # get package page name
  def package_page_name
    find(:css, '.section-header-title').text
  end

  # click first item
  def acessar_detalhes_item
    find(:css, '.card-prod:nth-child(1) > a.card-prod-details', wait: 180).click
  end

  # get item price
  def capturar_valor_parcelado
    price = find('section:nth-child(1) .card-prod-price').text
    matchdata = price.scan(/([1-9]\d{0,2}(,\d{2})*)/)

    numeroParcelas = matchdata.first[0]
    valorParcelas = matchdata.last[0]

    valor_total = numeroParcelas.to_f * valorParcelas.to_f
    puts "Cálculo total a prazo: #{valor_total}".colorize(:blue)
    valor_total
  end

end
