# language: pt

Funcionalidade: Busca cursos por professor
    Na tela inicial do site da Estratégia
    Devo clicar no filtro customizado "Por professor"
    e ser guiado para página de resultados onde vou escolher um professor 
    e através da página dele acessar e validar um curso 

    Contexto: Exibição da tela de resultados de pesquisa
        Dado que estou na página inicial do sistema

    Esquema do Cenário: Busca por filtro personalizado
        Quando clico no botão de filtro Por professor
        E preencho o campo de filtro com o "<nome>" e pesquiso
        E sistema exibe na lista o resultado filtrado
        Quando seleciono um pacote para ser detalhado
        E sistema direciona para página de detalhamento do pacote
        E entro no item capturando seu valor parcelado
        Então sistema direciona para página de detalhamento do curso

        Exemplos:
            |nome                                      |
            |Ena Loiola                                |