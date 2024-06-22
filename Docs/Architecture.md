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

- Model: Representa os dados e a lógica de negócios da aplicação.

- View: Responsável pela apresentação visual e pela interação com o usuário. Deve ser passiva, reagindo apenas às mudanças no ViewModel.

- ViewModel: Contém a lógica de apresentação, interage com o Model e fornece dados formatados para a View. É responsável por processar a entrada do usuário.

- Coordinator: Gerencia a navegação entre diferentes telas (ViewControllers). Ele cria ViewModels e ViewControllers e define como eles interagem.
