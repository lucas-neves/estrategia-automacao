# frozen_string_literal: true

# Page object: Detalhes
class Detalhes
  include Capybara::DSL

  # get page name
  def page_name
    find(:css, '.page-header-title', wait: 180).text
  end

  # get item price
  def capturar_valor_total
    mtch = find_all('.cur-details-shopping-price > div', text: '([1-9]\d{0,2}(,\d{2})*)', match: :prefer_exact)    
    puts mtch.first.text.colorize(:blue)
    mtch.first.text
  end

end
