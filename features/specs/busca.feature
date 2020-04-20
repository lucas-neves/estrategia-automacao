# language: pt

Funcionalidade: Busca
    Na tela inicial do site da Estratégia
    Devo escolher um mecanismo de busca (texto ou filtro)
    e ser guiado para página de resultados

    Contexto: Exibição da tela de resultados de pesquisa
        Dado que estou na página inicial do sistema

    Esquema do Cenário: Busca por palavra-chave simples
        Quando preencho o campo de pesquisa de cursos com "<palavra>" e pesquiso        
        Então sistema direciona para página de resultados

        Exemplos:
            |palavra                                   |
            |Pedagogia                                 |

    Esquema do Cenário: Busca por palavra-chave composta
        Quando preencho o campo de pesquisa com os termos "<palavras>" e pesquiso        
        Então sistema direciona para página de resultados

        Exemplos:
            |palavras                                  |
            |Perito médico                             |

    Esquema do Cenário: Busca por filtro personalizado
        Quando clico no botão de filtro Por professor
        E preencho o campo de filtro com o "<nome>" e pesquiso
        Então sistema exibe na lista o resultado filtrado

        Exemplos:
            |nome                                      |
            |Ena Loiola                                |