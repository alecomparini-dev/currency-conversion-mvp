
<h3 align="center">
  <br>
  <img src="https://github.com/alecomparini-dev/currency-conversion-mvp/assets/76792477/7c394686-cd06-4bc9-8da3-dc0c3715681c" height="250">
  <br>
</h3>

## FEATURES
> Este foi um teste encontrato na internet, onde a empresa solicitou em uma entrevista técnica o seguinte desafio.

#### # REQUISITOS OBRIGATÓRIOS:
- [x] As taxas de câmbio disponíveis devem ser obtidas da chamada de API Supported
Currencies [(/list)](https://currencylayer.com/documentation) 
- [x] A cotação atual deve ser obtida da chamada de API Real-time Rates [(/live)](https://currencylayer.com/documentation)
- [x] É necessário fazer tratamento de erros e dos fluxos de exceção, como busca vazia, carregamento e outros erros que possam ocorrer.
  - Concluida em partes, não foi criado erros específicos, porém os tratamentos de erro estão em todas as funções. Fluxos alternativos como busca vazia ok.
- [x] O aplicativo deve ter duas telas principais:
  - A tela de conversão deve conter:
    - Dois botões que permitam o usuário a escolher as moedas de origem e de destino.
    - Um campo de entrada de texto onde o usuário possa inserir o valor a ser convertido.
    -  Um campo de texto para apresentar o valor convertido.
  -  A tela de listagem de moedas deve conter:
    - Uma lista das moedas disponíveis para conversão, mostrando código e nome da moeda.
- [x] A listagem de moedas deve ser mostrada obrigatoriamente em uma tela diferente da tela de conversão.

#### # REQUISITOS OPCIONAIS (não necessário, porém contam pontos):
- [x] Funcionalidade de busca na lista de moedas por nome ou sigla da moeda ("dólar" ou "USD").
- [x] Ordenação da lista de moedas por nome ou código.
- [ ] Realizar a persistência local da lista de moedas e taxas para permitir o uso do app no caso de falta de internet.
- [x] Adicionar a capacidade de favoritar uma moeda para que ela sempre apareça no topo da lista.
- [ ] Desenvolver testes unitários e/ou funcionais.
- [x] Desenvolver o app seguindo a arquitetura MVVM.

#### # Observações:
- Evite utilizar bibliotecas externas ao máximo possível.
- Caso opte por usar bibliotecas externas, prefira o CocoaPods como gerenciador de dependências.
- O app deve consumir a API CurrencyLayer. Para utilizar a API será necessário fazer um cadastro no plano gratuito para obter uma chave de acesso. Como o plano gratuito da API apresenta apenas as taxas de câmbio em relação ao dólar americano (USD), caso o usuário deseje fazer uma conversão entre quaisquer outras duas moedas, será necessário primeiro
converter a moeda de origem para dólar e então de dólar para a moeda desejada.

---
## PREVIEW APP

<br>

https://github.com/alecomparini-dev/currency-conversion-mvp/assets/76792477/3bd92186-6cbf-46b2-b556-2b5e9a5b7afd

<br>

---
## DESENVOLVIMENTO
- Neste projeto foi utilizado:
  - UserDefaults para gravar as moedas favoritas
  - URLSession para as chamadas remotas
  - Foi utilizado o arquivo Env para armazenar a url base e a chave da API ***(Estou ciente que esta informação deverá ficar na esteira de deploy)***
- Não foi criado módulos para este projeto, foi utilizado um único target, porém foi separado os diretórios para seguir o padrão do clean architecture.

#### DEPENDÊNCIAS: 
  - Nenhuma depêndencia externa
 
- #### Gerenciador de Dependência:
  - Apesar de possuir no projeto o podFile, foi incluido somente para demonstrar que o projeto está preparado para usar o Alamofire ou o URLSession para chamadas remotas, quanto o UserDefaults como Realm para armazenamento, mostrando assim que o projeto está preparado para mudanças sem afetar o seu comportamento.

#### ARQUITETURA
- MVVM-C
- Clean Architecture

#### PATTERNS (em estudo)
- Strategy
- Builder
- Factory
- Adapter
- Repository

#### TESTE UNITÁRIOS
- XCTest

#### OUTROS
- Depedency Injection
- Princípios do SOLID
- Clean Code (em estudo)


<br>
