# language: pt

Funcionalidade: Listagem de cursos
    Na tela de resultados de pesquisa por cursos
    Devo verificar que o número de resultados é diferente de zero
    e que os resultados contém a(s) palavra(s)-chave buscadas

    Contexto: Verificação das informações de resultados
        Dado que estou na página de resultados

    Esquema do Cenário: Visualização de múltiplos resultados
        E capturo os termos da lista de resultados
        E verifico se os resultados contém o termo "<termo>"
        Quando seleciono um item para ser detalhado
        Então sistema direciona para página de detalhamente do curso

        Exemplos:
            |termo                                   |
            |Pedagogia                               |
            |Veterinário                             |
