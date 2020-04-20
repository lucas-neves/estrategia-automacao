# frozen_string_literal: true

# rubocop:disable Metrics/LineLength

# Configuracao do ambiente de teste para o cucumber
# Nao esquecer de colocar o chromedriver.exe no diretório do ruby /bin

# Importacoes necessarias:
require 'capybara'
require 'capybara/cucumber'
require 'colorize'
require 'rspec'
require 'selenium-webdriver'

# Environment variables
@browser = ENV['BROWSER']

# default chromeOptions
def driver_options
  { args: %w[--disable-gpu --headless --no-sandbox --disable-dev-shm-usage --test-type
             --disable-popup-blocking --disable-infobars ----disable-extensions] }
end

# Inicio da config default de navegador local
if @browser.eql?('chrome')
  Capybara.register_driver :selenium_chrome do |app|
    local_caps = Selenium::WebDriver::Remote::Capabilities.chrome(chromeOptions: driver_options)

    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      timeout: 300,
      desired_capabilities: local_caps
    )
  end
elsif @browser.eql?('chrome_headless')
  Capybara.register_driver :headless_chrome do |app|
    headless_caps = Selenium::WebDriver::Remote::Capabilities.chrome(chromeOptions: driver_options)

    # set timeout
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.read_timeout = 300 # seconds
    Selenium::WebDriver.for :chrome, http_client: client

    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      desired_capabilities: headless_caps
    )
  end
else
  raise 'Nenhum navegador/configuração disponivel'
end
# Fim da config default de navegador local

# Config Capybara
Capybara.configure do |config|
  config.default_max_wait_time = 20
  config.default_driver = if @browser.eql?('chrome')
                            :selenium_chrome
                          elsif @browser.eql?('chrome_headless')
                            :selenium_chrome_headless
                          else
                            raise 'Nenhum navegador foi selecionado'
                          end
end
# rubocop:enable Metrics/LineLength
