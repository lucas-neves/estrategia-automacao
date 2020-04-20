# language: pt

Funcionalidade: Detalhamento do curso
    Na tela de detalhes do curso escolhido
    Devo verificar se o valor apresentado do curso é igual ao valor obtido na tela de filtragem
    e devo verificar se o valor parcelado do curso confere com o valor total do curso

    Contexto: Verificação das informações do curso
        Dado que estou na página de detalhamento do curso

    Esquema do Cenário: Asserção do valor do curso
        Quando capturo os valores apresentados
        Então verifico que os valores estão em conformidade