# Automação Estratégia!
Testando a qualidade das features **busca**, **listagem** e **detalhamento** de cursos catalogados.

## BDD
Automação baseada em BDD com *Ruby + Selenium WebDriver+ Capybara + Rspec*

### User Story
**Funcionalidade:** Busca
Na tela inicial do site da Estratégia
Devo escolher um mecanismo de busca (texto ou filtro)
e ser guiado para página de resultados

**Funcionalidade:** Listagem
Na tela de resultados de pesquisa por cursos
Devo verificar que o número de resultados é diferente de zero
e que os resultados contém a(s) palavra(s)-chave buscadas

**Funcionalidade:** Detalhamento
Na tela de detalhes do curso escolhido
Devo verificar se o valor apresentado do curso é igual ao valor obtido na tela de filtragem
e devo verificar se o valor parcelado do curso confere com o valor total do curso

## Configuração

### Requisitos
- Rbenv 1.1.2
- Ruby 2.6.4

### Bundle
-  'capybara' -> 3.30
-  'colorize' -> 0.8
-  'cucumber' -> 3.2
-  'rspec' -> 3.9
-  'selenium-webdriver' -> 3.142

instalando as dependências
```
bundle install
```

### Cucumber exec
para executar a automação:
```
cucumber --format html --out report.html
