# MeLi Challenge
- Aplicativo que possibilita a consulta de produtos anunciados no [Mercado Livre](https://www.mercadolivre.com.br) e a visualização dos detalhes de cada produto.
- Desenvolvido no Xcode 15.3
- Versão mínima de compilação: iOS 15.0

# Evidências

<details>
    <summary>Home</summary>
  
   <img width="300" src="https://github.com/leojportes/MeliChallenge/assets/65302846/b20a81e9-73c7-49a0-b7e0-ea2d39009df2">
    
</details>

<details>
    <summary>Resultado de pesquisa</summary>
  
   <img width="300" src="https://github.com/leojportes/MeliChallenge/assets/65302846/708f74d4-8fc5-4262-9a17-dfd2cbca22c8">
      
</details>


<details>
   <summary>Detalhes do produto</summary>
    
  <img width="300" src="https://github.com/leojportes/MeliChallenge/assets/65302846/e93133a2-bd31-4158-964a-99d5bbde63ff">
      
</details>


# Funcionalidades

- [Serviços](#serviços)
  - [Endpoints](#endpoints)
  - [Telas](#telas)
  - [Melhorias](#melhorias)

- [Dependências](#dependências)


# Serviços

### Endpoints

Documentação disponível em: https://global-selling.mercadolibre.com/devsite/introduction-globalselling

* Pesquisar um produto por meio de texto: 
    - Texto pesquisado: iPhone 5
    - Ex de path: https://api.mercadolibre.com/sites/MLB/search?q=iPhone5
    
* Requisitar os detalhes de um produto por meio de ID: 
    - Ex de path: https://api.mercadolibre.com/items/MLB3398672845/description

### Telas

* Tela de pesquisa.
* Tela de resultado de pesquisa (Lista de produtos).
* Tela de detalhes de um produto.

### Melhorias

* Localizables Strings:
    - Centralizar Strings em um arquivo, assim possibilitando melhor compreensão e manutenção, como também uma futura tradução conforme localização.

* Utilização do RxSwift.

* [Accessibility](https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://developer.apple.com/accessibility/&ved=2ahUKEwipjdeKyu-GAxWYPbkGHQzhBREQFnoECAYQAQ&usg=AOvVaw0QP-Jlx1NbvYkE533pyd6Z)


# Arquitetura

- [Conceitos](#conceitos)
  - [ViewModel](#viewmodel)
  - [Controller](#controller)
  - [View](#view)

- [Arquitetura](#arquitetura)

## Conceitos

### ViewModel

Lida com regras de negócios e tudo mais, com exceção de renderização de views. 

```swift
class SampleViewModel {
    private let service: Service
    private let coordinator: AnyCoordinator
    
    init(service: Service = .init(), coordinator: AnyCoordinator) {
        self.service = service
        self.coordinator = coordinator
    }
}
```

### Controller

Faz o intermédio entre o ViewModel e a View, lidando com o ciclo de vida da plataforma.

```swift
class SampleController: CoordinatedController {
    private let viewModel: SampleViewModel
    
    private lazy var rootView = SampleView()

    init(viewModel: SampleViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    func fetchData() {
        viewModel.fetchData() { result in 
            rootView.setup(result)
        }
    }
}

```

### View

A view renderiza conteúdo de acordo com o estado. A ideia é deixar a View o mais burra possível para facilitar testes e leitura de código.

À medida que uma View fica complexa, é uma boa prática quebrar ela em componentes menores.

## Arquitetura

MVVM-C (Model-View-ViewModel-Coordinator)

O que é MVVM-C?

MVVM-C é um padrão arquitetural que combina o Model-View-ViewModel (MVVM) com o padrão Coordinator. Ele ajuda a organizar o código em aplicações iOS, tornando-o mais modular, testável e fácil de manter.

Componentes do MVVM-C:

Model: Representa os dados e a lógica de negócios da aplicação.

View: Responsável pela apresentação visual e pela interação com o usuário. Deve ser passiva, reagindo apenas às mudanças no ViewModel.

ViewModel: Contém a lógica de apresentação, interage com o Model e fornece dados formatados para a View. É responsável por processar a entrada do usuário.

Coordinator: Gerencia a navegação entre diferentes telas (ViewControllers). Ele cria ViewModels e ViewControllers e define como eles interagem.


# Dependências


- SnapshotTesting:

É uma técnica de teste que captura uma "foto" do estado da interface ou dos dados do aplicativo e a compara com uma versão de referência previamente salva.
Essa técnica é amplamente utilizada para verificar se mudanças no código não introduziram regressões visuais ou de dados.

- Exemplo:

```swift
import SnapshotTesting
import XCTest

@testable import MeliChallenge

class DummyViewControllerTests: XCTestCase {
    func test_dummyViewController_shouldReturnExpectedSnapshot() {
        let sut = makeSut()
        assertSnapshot(
            of: sut,
            as: .image,
            record: true
        )
    }
}

extension DummyViewControllerTests {
    func makeSut() -> DummyViewController {
        DummyViewController()
    }
}

```
