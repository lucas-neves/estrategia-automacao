# language: pt

Funcionalidade: Busca cursos por palavra chave
    Na tela inicial do site da Estratégia
    Devo preencher o campo de busca com a palavra desejada para que sejam exibidos
    os cursos e eu possa acessar e validar o detalhamento de algum

    Contexto: Exibição da tela de resultados de pesquisa
        Dado que estou na página inicial do sistema

    Esquema do Cenário: Busca por palavra-chave simples
        Quando preencho o campo de pesquisa de cursos com "<palavra>" e pesquiso        
        E sistema direciona para página de resultados
        E verifico se os resultados contém o termo "<palavra>"
        Quando seleciono um item para ser detalhado
        Então sistema direciona para página de detalhamento do curso

        Exemplos:
            |palavra                                 |
            |Pedagogia                               |

            