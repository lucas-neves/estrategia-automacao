# frozen_string_literal: true

# Page object: Home
class Home
  include Capybara::DSL

  # search for:
  def busca_palavra_chave(keywords)
    find(:css, "form.-desktop input[name='q']").set(keywords)
    click_on(class: 'search-input-icon')
  end

  # search for:
  def clicar_filtro_por(filtro)
    find(:css, filtro).click
  end

  # confirm alert
  def confirm_alert
    sleep 3
    find('#onesignal-popover-allow-button').click
  end
end
