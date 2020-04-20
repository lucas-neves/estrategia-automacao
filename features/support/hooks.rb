# frozen_string_literal: true

# Before each scenario
Before do
  # resize window
  page.current_window.maximize

  # class's instancies

  # Class Home
  @home = Home.new

  # Class PesquisaCursos
  @cursos = PesquisaCursos.new

  # Class CursosPorProfessor
  @cursosPorProf = CursosPorProfessor.new

  # Class Detalhes
  @detalhes = Detalhes.new
end

# take a shot
def add_screenshot(scenario)
  nome = scenario.name
  nome = nome.tr(' ', '_').downcase!
  sleep 5
  shot = "log/screenshots/#{nome}.png"
  page.save_screenshot(shot)
  embed(shot, 'image/png', 'Artifacts')
end

# exception message
def exception_message(scenario)
  scene = scenario.failed?
  return unless scene == true

  puts "#{scenario.exception.message}\n".colorize(:red)
end

# After each scenario
After do |scenario|
  add_screenshot(scenario)
  exception_message(scenario)
end
