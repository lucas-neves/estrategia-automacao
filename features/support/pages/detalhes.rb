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
    price = find('div.value').text  
    matchdata = price.scan(/([1-9]\d{0,2}(,\d{2})*)/)
    valor_total = matchdata.first[0].to_f
    puts "Valor total do curso: #{valor_total}".colorize(:blue)
    valor_total
  end

end
